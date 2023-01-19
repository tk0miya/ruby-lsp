# typed: strict
# frozen_string_literal: true

module RubyLsp
  module Requests
    class Rename < BaseRequest
      extend T::Sig

      ALLOWED_TARGETS = T.let(
        [
          SyntaxTree::Command,
          SyntaxTree::CallNode,
        ],
        T::Array[T.class_of(SyntaxTree::Node)],
      )

      sig { params(document: Document, position: Document::PositionShape).void }
      def initialize(document, position, new_name)
        super(document)

        @position = T.let(document.create_scanner.find_char_position(position), Integer)
      end

      sig { override.returns(T.nilable(LanguageServer::Protocol::Interface::Hover)) }
      def run
        return unless @document.parsed?

        target, parent = locate(T.must(@document.tree), @position)
        target = parent if !ALLOWED_TARGETS.include?(target.class) && ALLOWED_TARGETS.include?(parent.class)

        warn("got here in run, #{target.inspect}")

        # case target
        # when SyntaxTree::Command
        #   message = target.message
        #   generate_rails_document_link_hover(message.value, message)
        # when SyntaxTree::CallNode
        #   return if target.message == :call
        #
        #   generate_rails_document_link_hover(target.message.value, target.message)
        # when SyntaxTree::ConstPathRef
        #   constant_name = full_constant_name(target)
        #   generate_rails_document_link_hover(constant_name, target)
        # end
      end

      private

      sig do
        params(name: String, node: SyntaxTree::Node).returns(T.nilable(LanguageServer::Protocol::Interface::Hover))
      end
      def generate_rails_document_link_hover(name, node)
        urls = Support::RailsDocumentClient.generate_rails_document_urls(name)

        return if urls.empty?

        contents = LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: urls.join("\n\n"),
        )
        LanguageServer::Protocol::Interface::Hover.new(
          range: range_from_syntax_tree_node(node),
          contents: contents,
        )
      end
    end
  end
end
