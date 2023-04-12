# typed: true
# frozen_string_literal: true

require "test_helper"

class IndexTest < Minitest::Test
  def test_index_is_populated_on_initialization
    refute_empty(RubyLsp::Index.instance.files)
  end

  def test_synchronizing_an_addition
    RubyLsp::Index.instance.synchronize([{
      uri: "file://#{File.expand_path("../lib/ruby_lsp/some_new_file.rb", __dir__)}",
      type: RubyLsp::Constant::FileChangeType::CREATED,
    }])

    assert_includes(RubyLsp::Index.instance.files, "ruby_lsp/some_new_file")
  end

  def test_synchronizing_a_removal
    RubyLsp::Index.instance.synchronize([{
      uri: "file://#{File.expand_path("../lib/ruby_lsp/index.rb", __dir__)}",
      type: RubyLsp::Constant::FileChangeType::DELETED,
    }])

    refute_includes(RubyLsp::Index.instance.files, "ruby_lsp/index")
  end

  def test_synchronizing_a_change
    current_files = RubyLsp::Index.instance.files.dup

    RubyLsp::Index.instance.synchronize([{
      uri: "file://#{File.expand_path("../lib/ruby_lsp/index.rb", __dir__)}",
      type: RubyLsp::Constant::FileChangeType::CHANGED,
    }])

    # Currently, we're not doing anything on file changes. This will change when we actually index the codebase
    assert_equal(current_files, RubyLsp::Index.instance.files)
  end

  def test_synchronizing_a_folder
    current_files = RubyLsp::Index.instance.files.dup
    path = File.expand_path("../lib/ruby_lsp/new_folder", __dir__)

    FileUtils.mkdir(path)
    RubyLsp::Index.instance.synchronize([{
      uri: "file://#{path}",
      type: RubyLsp::Constant::FileChangeType::CREATED,
    }])

    # Currently, we're not doing anything on file changes. This will change when we actually index the codebase
    assert_equal(current_files, RubyLsp::Index.instance.files)
  ensure
    FileUtils.rm_rf(T.must(path))
  end
end
