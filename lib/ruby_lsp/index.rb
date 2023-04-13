# typed: strict
# frozen_string_literal: true

require "shellwords"

module RubyLsp
  class Index
    extend T::Sig
    include Singleton

    sig { returns(T::Array[String]) }
    attr_reader :files

    sig { returns(Requests::Support::PrefixTree) }
    attr_reader :prefix_tree

    sig { void }
    def initialize
      @files = T.let(
        $LOAD_PATH.flat_map { |p| Dir.glob("#{p}/**/*.rb") },
        T::Array[String],
      )

      @prefix_tree = T.let(Requests::Support::PrefixTree.new(files_to_prefix_tree), Requests::Support::PrefixTree)
      @constants = T.let(
        Hash.new do |h, k|
          h[k] = []
        end,
        T::Hash[String, T::Array[{ uri: String, location: SyntaxTree::Location }]],
      )

      @files.each { |file| index_single(file) }
    end

    sig { params(changes: T::Array[{ uri: String, type: Integer }]).void }
    def synchronize(changes)
      has_addition_or_removals = T.let(false, T::Boolean)

      changes.each do |change|
        # File change events include folders, but we're only interested in files
        uri = URI(change[:uri])
        file_path = Shellwords.escape(URI.decode_www_form_component(T.must(uri.path)))
        next if File.directory?(file_path)

        remove_entries_for_file(file_path)

        case change[:type]
        when Constant::FileChangeType::CREATED
          has_addition_or_removals = true
          @files << file_path
          index_single(file_path)
        when Constant::FileChangeType::CHANGED
          # Do nothing for now
          index_single(file_path)
        when Constant::FileChangeType::DELETED
          has_addition_or_removals = true
          @files.delete(file_path)
        end
      end

      @prefix_tree = Requests::Support::PrefixTree.new(files_to_prefix_tree) if has_addition_or_removals
    end

    sig { params(constant_name: String).returns(T.nilable(T::Array[{ uri: String, location: SyntaxTree::Location }])) }
    def fetch_constant(constant_name)
      @constants[constant_name]
    end

    private

    sig { params(path: String).void }
    def index_single(path)
      content = File.read(path)
      ast = SyntaxTree.parse(content)
      visitor = IndexVisitor.new
      visitor.visit(ast)

      visitor.consts.each do |constant|
        T.must(@constants[constant.constant.constant.value]) << {
          uri: "file://#{path}",
          location: constant.location,
        }
      end
    rescue SyntaxTree::Parser::ParseError
      # If we fail to parse a file we just skip it
    end

    sig { params(file_path: String).void }
    def remove_entries_for_file(file_path)
      @constants.each do |constant_name, entries|
        entries.delete_if { |entry| entry[:uri].end_with?(file_path) }

        @constants.delete(constant_name) if entries.empty?
      end
    end

    sig { returns(T::Array[String]) }
    def files_to_prefix_tree
      @files.map do |file|
        base = $LOAD_PATH.find { |path| file.start_with?(path) }
        file
          .delete_prefix(base)
          .delete_suffix(".rb")
      end
    end
  end
end
