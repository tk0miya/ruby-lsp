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
      @files = T.let(collect_files, T::Array[String])
      @prefix_tree = T.let(Requests::Support::PrefixTree.new(@files), Requests::Support::PrefixTree)
    end

    sig { params(changes: T::Array[{ uri: String, type: Integer }]).void }
    def synchronize(changes)
      has_addition_or_removals = T.let(false, T::Boolean)

      changes.each do |change|
        # File change events include folders, but we're only interested in files
        uri = URI(change[:uri])
        file_path = Shellwords.escape(URI.decode_www_form_component(T.must(uri.path)))
        path = Pathname.new(file_path)
        next if path.directory?

        # Get the relative path based on the LOAD_PATH
        base_load_path = $LOAD_PATH.find { |path| file_path.start_with?(path) }
        next if base_load_path.nil?

        require_path = path.relative_path_from(base_load_path).to_s
        require_path.delete_suffix!(".rb")

        case change[:type]
        when Constant::FileChangeType::CREATED
          has_addition_or_removals = true
          @files << require_path
        when Constant::FileChangeType::CHANGED
          # Do nothing for now
        when Constant::FileChangeType::DELETED
          has_addition_or_removals = true
          @files.delete(require_path)
        end
      end

      @prefix_tree = Requests::Support::PrefixTree.new(@files) if has_addition_or_removals
    end

    private

    sig { returns(T::Array[String]) }
    def collect_files
      $LOAD_PATH.flat_map do |p|
        Dir.glob("**/*.rb", base: p)
      end.map! do |result|
        result.delete_suffix!(".rb")
      end
    end
  end
end
