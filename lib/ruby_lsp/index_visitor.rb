# typed: strict
# frozen_string_literal: true

module RubyLsp
  class IndexVisitor < SyntaxTree::Visitor
    extend T::Sig

    sig { returns(T::Array[SyntaxTree::ClassDeclaration]) }
    attr_reader :consts

    sig { void }
    def initialize
      @consts = T.let([], T::Array[SyntaxTree::ClassDeclaration])
      super
    end

    sig { override.params(node: SyntaxTree::ClassDeclaration).void }
    def visit_class(node)
      @consts << node
      super
    end
  end
end
