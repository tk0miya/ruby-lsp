# typed: strict
# frozen_string_literal: true

module RubyLsp
  module Requests
    class Definition < Listener
      extend T::Sig
      extend T::Generic

      ResponseType = type_member { { fixed: T.nilable(T::Array[Interface::Location]) } }

      sig { override.returns(ResponseType) }
      attr_reader :response

      sig { void }
      def initialize
        @response = T.let(nil, ResponseType)
        super()
      end

      listener_events do
        sig { params(node: SyntaxTree::Const).void }
        def on_const(node)
          locations = Index.instance.fetch_constant(node.value)
          return unless locations

          @response = locations.map do |loc|
            Interface::Location.new(uri: loc[:uri], range: Interface::Range.new(
              start: Interface::Position.new(
                line: loc[:location].start_line - 1,
                character: loc[:location].start_column,
              ),
              end: Interface::Position.new(line: loc[:location].end_line - 1, character: loc[:location].end_column),
            ))
          end
        end
      end
    end
  end
end
