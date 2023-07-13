# typed: true
# frozen_string_literal: true

require "test_helper"

class ShowSyntaxTreeTest < Minitest::Test
  def setup
    @message_queue = Thread::Queue.new
  end

  def teardown
    @message_queue.close
  end

  def test_returns_partial_tree_if_document_has_syntax_error
    store = RubyLsp::Store.new
    store.set(uri: "file:///fake.rb", source: "foo do", version: 1)
    response = RubyLsp::Executor.new(store, @message_queue).execute({
      method: "rubyLsp/textDocument/showSyntaxTree",
      params: { textDocument: { uri: "file:///fake.rb" } },
    }).response

    assert_equal(<<~AST, response[:ast])
      ProgramNode(0...6)(
        [],
        StatementsNode(0...6)(
          [CallNode(0...6)(
             nil,
             nil,
             (0...3),
             nil,
             nil,
             nil,
             BlockNode(4...6)(
               [],
               nil,
               StatementsNode(4...6)([MissingNode(4...6)()]),
               (4...6),
               (6...6)
             ),
             0,
             \"foo\"
           )]
        )
      )
    AST
  end

  def test_returns_ast_if_document_is_parsed
    store = RubyLsp::Store.new
    store.set(uri: "file:///fake.rb", source: "foo = 123", version: 1)
    document = store.get("file:///fake.rb")
    document.parse

    response = RubyLsp::Executor.new(store, @message_queue).execute({
      method: "rubyLsp/textDocument/showSyntaxTree",
      params: { textDocument: { uri: "file:///fake.rb" } },
    }).response

    assert_equal(<<~AST, response[:ast])
      ProgramNode(0...9)(
        [:foo],
        StatementsNode(0...9)(
          [LocalVariableWriteNode(0...9)(
             :foo,
             0,
             IntegerNode(6...9)(),
             (0...3),
             (4...5)
           )]
        )
      )
    AST
  end
end
