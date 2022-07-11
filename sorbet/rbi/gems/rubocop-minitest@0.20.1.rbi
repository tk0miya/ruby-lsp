# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rubocop-minitest` gem.
# Please instead update this file by running `bin/tapioca gem rubocop-minitest`.

module RuboCop; end
module RuboCop::Cop; end

# Methods that calculate and return `Parser::Source::Ranges`.
module RuboCop::Cop::ArgumentRangeHelper
  include ::RuboCop::Cop::RangeHelp

  private

  def all_arguments_range(node); end
  def first_and_second_arguments_range(node); end
  def first_argument_range(node); end
end

RuboCop::Cop::IgnoredPattern = RuboCop::Cop::AllowedPattern

# Common functionality for `AssertInDelta` and `RefuteInDelta` cops.
module RuboCop::Cop::InDeltaMixin
  def on_send(node); end

  private

  def assertion_method; end
  def build_good_method(expected, actual, message); end
end

RuboCop::Cop::InDeltaMixin::MSG = T.let(T.unsafe(nil), String)
module RuboCop::Cop::Minitest; end

# Enforces the test to use `assert_empty` instead of using `assert(object.empty?)`.
#
# @example
#   # bad
#   assert(object.empty?)
#   assert(object.empty?, 'message')
#
#   # good
#   assert_empty(object)
#   assert_empty(object, 'message')
class RuboCop::Cop::Minitest::AssertEmpty < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::AssertEmpty::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertEmpty::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_empty`
# instead of using `assert_equal([], object)` or `assert_equal({}, object)`.
#
# @example
#   # bad
#   assert_equal([], object)
#   assert_equal({}, object)
#
#   # good
#   assert_empty(object)
class RuboCop::Cop::Minitest::AssertEmptyLiteral < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::AutoCorrector

  def assert_equal_with_empty_literal(param0 = T.unsafe(nil)); end
  def on_send(node); end
end

RuboCop::Cop::Minitest::AssertEmptyLiteral::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertEmptyLiteral::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the use of `assert_equal(expected, actual)`
# over `assert(expected == actual)`.
#
# @example
#   # bad
#   assert("rubocop-minitest" == actual)
#
#   # good
#   assert_equal("rubocop-minitest", actual)
class RuboCop::Cop::Minitest::AssertEqual < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::AssertEqual::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertEqual::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_in_delta`
# instead of using `assert_equal` to compare floats.
#
# @example
#   # bad
#   assert_equal(0.2, actual)
#   assert_equal(0.2, actual, 'message')
#
#   # good
#   assert_in_delta(0.2, actual)
#   assert_in_delta(0.2, actual, 0.001, 'message')
class RuboCop::Cop::Minitest::AssertInDelta < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::InDeltaMixin
  extend ::RuboCop::Cop::AutoCorrector

  def equal_floats_call(param0 = T.unsafe(nil)); end
end

RuboCop::Cop::Minitest::AssertInDelta::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_includes`
# instead of using `assert(collection.include?(object))`.
#
# @example
#   # bad
#   assert(collection.include?(object))
#   assert(collection.include?(object), 'message')
#
#   # good
#   assert_includes(collection, object)
#   assert_includes(collection, object, 'message')
class RuboCop::Cop::Minitest::AssertIncludes < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::AssertIncludes::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertIncludes::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_instance_of(Class, object)`
# over `assert(object.instance_of?(Class))`.
#
# @example
#   # bad
#   assert(object.instance_of?(Class))
#   assert(object.instance_of?(Class), 'message')
#
#   # good
#   assert_instance_of(Class, object)
#   assert_instance_of(Class, object, 'message')
class RuboCop::Cop::Minitest::AssertInstanceOf < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::AssertInstanceOf::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertInstanceOf::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_kind_of(Class, object)`
# over `assert(object.kind_of?(Class))`.
#
# @example
#   # bad
#   assert(object.kind_of?(Class))
#   assert(object.kind_of?(Class), 'message')
#
#   # good
#   assert_kind_of(Class, object)
#   assert_kind_of(Class, object, 'message')
class RuboCop::Cop::Minitest::AssertKindOf < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::AssertKindOf::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertKindOf::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_match`
# instead of using `assert(matcher.match(string))`.
#
# @example
#   # bad
#   assert(matcher.match(string))
#   assert(matcher.match(string), 'message')
#
#   # good
#   assert_match(regex, string)
#   assert_match(matcher, string, 'message')
class RuboCop::Cop::Minitest::AssertMatch < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::AssertMatch::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertMatch::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_nil` instead of using
# `assert_equal(nil, something)`, `assert(something.nil?)`, or `assert_predicate(something, :nil?)`.
#
# @example
#   # bad
#   assert_equal(nil, actual)
#   assert_equal(nil, actual, 'message')
#   assert(object.nil?)
#   assert(object.nil?, 'message')
#   assert_predicate(object, :nil?)
#   assert_predicate(object, :nil?, 'message')
#
#   # good
#   assert_nil(actual)
#   assert_nil(actual, 'message')
class RuboCop::Cop::Minitest::AssertNil < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  include ::RuboCop::Cop::Minitest::NilAssertionHandleable
  extend ::RuboCop::Cop::AutoCorrector

  def nil_assertion(param0 = T.unsafe(nil)); end
  def on_send(node); end

  private

  def assertion_type; end
end

RuboCop::Cop::Minitest::AssertNil::ASSERTION_TYPE = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertNil::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Checks for opportunities to use `assert_output`.
#
# @example
#   # bad
#   $stdout = StringIO.new
#   puts object.method
#   $stdout.rewind
#   assert_match expected, $stdout.read
#
#   # good
#   assert_output(expected) { puts object.method }
class RuboCop::Cop::Minitest::AssertOutput < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::MinitestExplorationHelpers

  def on_gvasgn(node); end

  private

  def find_test_case(node); end

  # @return [Boolean]
  def references_gvar?(assertion, gvar_name); end
end

RuboCop::Cop::Minitest::AssertOutput::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertOutput::OUTPUT_GLOBAL_VARIABLES = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_path_exists` instead of using `assert(File.exist?(path))`.
#
# @example
#   # bad
#   assert(File.exist?(path))
#   assert(File.exist?(path), 'message')
#
#   # good
#   assert_path_exists(path)
#   assert_path_exists(path, 'message')
class RuboCop::Cop::Minitest::AssertPathExists < ::RuboCop::Cop::Base
  extend ::RuboCop::Cop::AutoCorrector

  def assert_file_exists(param0 = T.unsafe(nil)); end
  def on_send(node); end

  private

  def build_good_method(path, message); end
end

RuboCop::Cop::Minitest::AssertPathExists::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertPathExists::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_predicate`
# instead of using `assert(obj.a_predicate_method?)`.
#
# @example
#   # bad
#   assert(obj.one?)
#   assert(obj.one?, 'message')
#
#   # good
#   assert_predicate(obj, :one?)
#   assert_predicate(obj, :one?, 'message')
class RuboCop::Cop::Minitest::AssertPredicate < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  include ::RuboCop::Cop::Minitest::PredicateAssertionHandleable
  extend ::RuboCop::Cop::AutoCorrector

  private

  def assertion_type; end
end

RuboCop::Cop::Minitest::AssertPredicate::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertPredicate::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the use of `assert_respond_to(object, :do_something)`
# over `assert(object.respond_to?(:do_something))`.
#
# @example
#   # bad
#   assert(object.respond_to?(:do_something))
#   assert(object.respond_to?(:do_something), 'message')
#   assert(respond_to?(:do_something))
#
#   # good
#   assert_respond_to(object, :do_something)
#   assert_respond_to(object, :do_something, 'message')
#   assert_respond_to(self, :do_something)
class RuboCop::Cop::Minitest::AssertRespondTo < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::AssertRespondTo::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertRespondTo::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `assert_silent { ... }`
# instead of using `assert_output('', '') { ... }`.
#
# @example
#   # bad
#   assert_output('', '') { puts object.do_something }
#
#   # good
#   assert_silent { puts object.do_something }
class RuboCop::Cop::Minitest::AssertSilent < ::RuboCop::Cop::Base
  extend ::RuboCop::Cop::AutoCorrector

  def assert_silent_candidate?(param0 = T.unsafe(nil)); end
  def on_block(node); end

  private

  # @return [Boolean]
  def empty_string?(node); end
end

RuboCop::Cop::Minitest::AssertSilent::MSG = T.let(T.unsafe(nil), String)

# Enforces the test to use `assert(actual)` instead of using `assert_equal(true, actual)`.
#
# @example
#   # bad
#   assert_equal(true, actual)
#   assert_equal(true, actual, 'message')
#
#   # good
#   assert(actual)
#   assert(actual, 'message')
class RuboCop::Cop::Minitest::AssertTruthy < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::AutoCorrector

  def assert_equal_with_truthy(param0 = T.unsafe(nil)); end
  def on_send(node); end
end

RuboCop::Cop::Minitest::AssertTruthy::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertTruthy::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Tries to detect when a user accidentally used
# `assert` when they meant to use `assert_equal`.
#
# @example
#   # bad
#   assert(3, my_list.length)
#   assert(expected, actual)
#
#   # good
#   assert_equal(3, my_list.length)
#   assert_equal(expected, actual)
#   assert(foo, 'message')
class RuboCop::Cop::Minitest::AssertWithExpectedArgument < ::RuboCop::Cop::Base
  def assert_with_two_arguments?(param0 = T.unsafe(nil)); end
  def on_send(node); end
end

RuboCop::Cop::Minitest::AssertWithExpectedArgument::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::AssertWithExpectedArgument::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Checks for usage of assertions in lifecycle hooks.
#
# @example
#   # bad
#   class FooTest < Minitest::Test
#   def setup
#   assert_equal(foo, bar)
#   end
#   end
#
#   # good
#   class FooTest < Minitest::Test
#   def test_something
#   assert_equal(foo, bar)
#   end
#   end
class RuboCop::Cop::Minitest::AssertionInLifecycleHook < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::MinitestExplorationHelpers

  def on_class(class_node); end
end

RuboCop::Cop::Minitest::AssertionInLifecycleHook::MSG = T.let(T.unsafe(nil), String)

# If a Minitest class inherits from another class,
# it will also inherit its methods causing Minitest to run the parent's tests methods twice.
#
# This cop detects when there are two tests classes, one inherits from the other, and both have tests methods.
# This cop will add an offense to the Child class in such a case.
#
# @example
#   # bad
#   class ParentTest < Minitest::Test
#   def test_parent # it will run this test twice.
#   end
#   end
#
#   class ChildTest < ParentTest
#   def test_child
#   end
#   end
#
#   # good
#   class ParentTest < Minitest::Test
#   def test_parent
#   end
#   end
#
#   class ChildTest < Minitest::Test
#   def test_child
#   end
#   end
#
#   # good
#   class ParentTest < Minitest::Test
#   end
#
#   class ChildTest
#   def test_child
#   end
#
#   def test_parent
#   end
#   end
class RuboCop::Cop::Minitest::DuplicateTestRun < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::MinitestExplorationHelpers

  def on_class(class_node); end

  private

  # @return [Boolean]
  def parent_class_has_test_methods?(class_node); end

  # @return [Boolean]
  def test_methods?(class_node); end
end

RuboCop::Cop::Minitest::DuplicateTestRun::MSG = T.let(T.unsafe(nil), String)

# Checks for deprecated global expectations
# and autocorrects them to use expect format.
#
# @example EnforcedStyle: any (default)
#   # bad
#   musts.must_equal expected_musts
#   wonts.wont_match expected_wonts
#   musts.must_raise TypeError
#
#   # good
#   _(musts).must_equal expected_musts
#   _(wonts).wont_match expected_wonts
#   _ { musts }.must_raise TypeError
#
#   expect(musts).must_equal expected_musts
#   expect(wonts).wont_match expected_wonts
#   expect { musts }.must_raise TypeError
#
#   value(musts).must_equal expected_musts
#   value(wonts).wont_match expected_wonts
#   value { musts }.must_raise TypeError
# @example EnforcedStyle: _
#   # bad
#   musts.must_equal expected_musts
#   wonts.wont_match expected_wonts
#   musts.must_raise TypeError
#
#   expect(musts).must_equal expected_musts
#   expect(wonts).wont_match expected_wonts
#   expect { musts }.must_raise TypeError
#
#   value(musts).must_equal expected_musts
#   value(wonts).wont_match expected_wonts
#   value { musts }.must_raise TypeError
#
#   # good
#   _(musts).must_equal expected_musts
#   _(wonts).wont_match expected_wonts
#   _ { musts }.must_raise TypeError
# @example EnforcedStyle: expect
#   # bad
#   musts.must_equal expected_musts
#   wonts.wont_match expected_wonts
#   musts.must_raise TypeError
#
#   _(musts).must_equal expected_musts
#   _(wonts).wont_match expected_wonts
#   _ { musts }.must_raise TypeError
#
#   value(musts).must_equal expected_musts
#   value(wonts).wont_match expected_wonts
#   value { musts }.must_raise TypeError
#
#   # good
#   expect(musts).must_equal expected_musts
#   expect(wonts).wont_match expected_wonts
#   expect { musts }.must_raise TypeError
# @example EnforcedStyle: value
#   # bad
#   musts.must_equal expected_musts
#   wonts.wont_match expected_wonts
#   musts.must_raise TypeError
#
#   _(musts).must_equal expected_musts
#   _(wonts).wont_match expected_wonts
#   _ { musts }.must_raise TypeError
#
#   expect(musts).must_equal expected_musts
#   expect(wonts).wont_match expected_wonts
#   expect { musts }.must_raise TypeError
#
#   # good
#   value(musts).must_equal expected_musts
#   value(wonts).wont_match expected_wonts
#   value { musts }.must_raise TypeError
class RuboCop::Cop::Minitest::GlobalExpectations < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::ConfigurableEnforcedStyle
  extend ::RuboCop::Cop::AutoCorrector

  def block_receiver?(param0 = T.unsafe(nil)); end
  def on_send(node); end
  def value_receiver?(param0 = T.unsafe(nil)); end

  private

  # @return [Boolean]
  def method_allowed?(method); end

  def preferred_method; end
  def preferred_receiver(node); end
  def register_offense(node, method); end
end

RuboCop::Cop::Minitest::GlobalExpectations::BLOCK_MATCHERS = T.let(T.unsafe(nil), Array)

# There are aliases for the `_` method - `expect` and `value`
RuboCop::Cop::Minitest::GlobalExpectations::DSL_METHODS = T.let(T.unsafe(nil), Array)

RuboCop::Cop::Minitest::GlobalExpectations::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::GlobalExpectations::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)
RuboCop::Cop::Minitest::GlobalExpectations::VALUE_MATCHERS = T.let(T.unsafe(nil), Array)

# Enforces correct order of expected and
# actual arguments for `assert_equal`.
#
# @example
#   # bad
#   assert_equal foo, 2
#   assert_equal foo, [1, 2]
#   assert_equal foo, [1, 2], 'message'
#
#   # good
#   assert_equal 2, foo
#   assert_equal [1, 2], foo
#   assert_equal [1, 2], foo, 'message'
class RuboCop::Cop::Minitest::LiteralAsActualArgument < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, expected, actual, message); end
  def on_send(node); end
end

RuboCop::Cop::Minitest::LiteralAsActualArgument::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::LiteralAsActualArgument::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Checks if test cases contain too many assertion calls.
# The maximum allowed assertion calls is configurable.
#
# @example Max: 1
#   # bad
#   class FooTest < Minitest::Test
#   def test_asserts_twice
#   assert_equal(42, do_something)
#   assert_empty(array)
#   end
#   end
#
#   # good
#   class FooTest < Minitest::Test
#   def test_asserts_once
#   assert_equal(42, do_something)
#   end
#
#   def test_another_asserts_once
#   assert_empty(array)
#   end
#   end
class RuboCop::Cop::Minitest::MultipleAssertions < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::ConfigurableMax
  include ::RuboCop::Cop::MinitestExplorationHelpers

  def on_class(class_node); end

  private

  def assertions_count(node); end
  def max_assertions; end
end

RuboCop::Cop::Minitest::MultipleAssertions::MSG = T.let(T.unsafe(nil), String)

# Common functionality for `AssertNil` and `RefuteNil` cops.
module RuboCop::Cop::Minitest::NilAssertionHandleable
  private

  def autocorrect(corrector, node, actual); end
  def build_message(node, actual, message); end

  # @return [Boolean]
  def comparison_or_predicate_assertion_method?(node); end

  def register_offense(node, actual, message); end
end

RuboCop::Cop::Minitest::NilAssertionHandleable::MSG = T.let(T.unsafe(nil), String)

# Checks if test cases contain any assertion calls.
#
# @example
#   # bad
#   class FooTest < Minitest::Test
#   def test_the_truth
#   end
#   end
#
#   # good
#   class FooTest < Minitest::Test
#   def test_the_truth
#   assert true
#   end
#   end
class RuboCop::Cop::Minitest::NoAssertions < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::MinitestExplorationHelpers

  def on_class(class_node); end

  private

  def assertions_count(node); end
end

RuboCop::Cop::Minitest::NoAssertions::MSG = T.let(T.unsafe(nil), String)

# Common functionality for `Minitest/AssertPredicate` and `Minitest/RefutePredicate` cops.
module RuboCop::Cop::Minitest::PredicateAssertionHandleable
  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end

  # @return [Boolean]
  def predicate_method?(first_argument); end
end

RuboCop::Cop::Minitest::PredicateAssertionHandleable::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::PredicateAssertionHandleable::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces to use `refute_empty` instead of using `refute(object.empty?)`.
#
# @example
#   # bad
#   refute(object.empty?)
#   refute(object.empty?, 'message')
#
#   # good
#   refute_empty(object)
#   refute_empty(object, 'message')
class RuboCop::Cop::Minitest::RefuteEmpty < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::RefuteEmpty::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteEmpty::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the use of `refute_equal(expected, object)`
# over `assert(expected != actual)` or `assert(! expected == actual)`.
#
# @example
#   # bad
#   assert("rubocop-minitest" != actual)
#   assert(! "rubocop-minitest" == actual)
#
#   # good
#   refute_equal("rubocop-minitest", actual)
class RuboCop::Cop::Minitest::RefuteEqual < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::AutoCorrector

  def assert_not_equal(param0 = T.unsafe(nil)); end
  def on_send(node); end

  private

  def original_usage(first_part, custom_message); end
  def preferred_usage(first_arg, second_arg, custom_message = T.unsafe(nil)); end
  def process_not_equal(node); end
end

RuboCop::Cop::Minitest::RefuteEqual::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteEqual::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the use of `refute(object)` over `assert_equal(false, object)`.
#
# @example
#   # bad
#   assert_equal(false, actual)
#   assert_equal(false, actual, 'message')
#
#   assert(!test)
#   assert(!test, 'message')
#
#   # good
#   refute(actual)
#   refute(actual, 'message')
class RuboCop::Cop::Minitest::RefuteFalse < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::AutoCorrector

  def assert_equal_with_false(param0 = T.unsafe(nil)); end
  def assert_with_bang_argument(param0 = T.unsafe(nil)); end
  def on_send(node); end

  private

  def autocorrect(corrector, node, actual); end
end

RuboCop::Cop::Minitest::RefuteFalse::MSG_FOR_ASSERT = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteFalse::MSG_FOR_ASSERT_EQUAL = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteFalse::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `refute_in_delta`
# instead of using `refute_equal` to compare floats.
#
# @example
#   # bad
#   refute_equal(0.2, actual)
#   refute_equal(0.2, actual, 'message')
#
#   # good
#   refute_in_delta(0.2, actual)
#   refute_in_delta(0.2, actual, 0.001, 'message')
class RuboCop::Cop::Minitest::RefuteInDelta < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::InDeltaMixin
  extend ::RuboCop::Cop::AutoCorrector

  def equal_floats_call(param0 = T.unsafe(nil)); end
end

RuboCop::Cop::Minitest::RefuteInDelta::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `refute_includes`
# instead of using `refute(collection.include?(object))`.
#
# @example
#   # bad
#   refute(collection.include?(object))
#   refute(collection.include?(object), 'message')
#
#   # good
#   refute_includes(collection, object)
#   refute_includes(collection, object, 'message')
class RuboCop::Cop::Minitest::RefuteIncludes < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::RefuteIncludes::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteIncludes::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the use of `refute_instance_of(Class, object)`
# over `refute(object.instance_of?(Class))`.
#
# @example
#   # bad
#   refute(object.instance_of?(Class))
#   refute(object.instance_of?(Class), 'message')
#
#   # good
#   refute_instance_of(Class, object)
#   refute_instance_of(Class, object, 'message')
class RuboCop::Cop::Minitest::RefuteInstanceOf < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::RefuteInstanceOf::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteInstanceOf::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the use of `refute_kind_of(Class, object)`
# over `refute(object.kind_of?(Class))`.
#
# @example
#   # bad
#   refute(object.kind_of?(Class))
#   refute(object.kind_of?(Class), 'message')
#
#   # good
#   refute_kind_of(Class, object)
#   refute_kind_of(Class, object, 'message')
class RuboCop::Cop::Minitest::RefuteKindOf < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::RefuteKindOf::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteKindOf::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `refute_match`
# instead of using `refute(matcher.match(string))`.
#
# @example
#   # bad
#   refute(matcher.match(string))
#   refute(matcher.match(string), 'message')
#
#   # good
#   refute_match(matcher, string)
#   refute_match(matcher, string, 'message')
class RuboCop::Cop::Minitest::RefuteMatch < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::RefuteMatch::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteMatch::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `refute_nil` instead of using
# `refute_equal(nil, something)`, `refute(something.nil?)`, or `refute_predicate(something, :nil?)`.
#
# @example
#   # bad
#   refute_equal(nil, actual)
#   refute_equal(nil, actual, 'message')
#   refute(actual.nil?)
#   refute(actual.nil?, 'message')
#   refute_predicate(object, :nil?)
#   refute_predicate(object, :nil?, 'message')
#
#   # good
#   refute_nil(actual)
#   refute_nil(actual, 'message')
class RuboCop::Cop::Minitest::RefuteNil < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  include ::RuboCop::Cop::Minitest::NilAssertionHandleable
  extend ::RuboCop::Cop::AutoCorrector

  def nil_refutation(param0 = T.unsafe(nil)); end
  def on_send(node); end

  private

  def assertion_type; end
end

RuboCop::Cop::Minitest::RefuteNil::ASSERTION_TYPE = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteNil::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `refute_path_exists` instead of using `refute(File.exist?(path))`.
#
# @example
#   # bad
#   refute(File.exist?(path))
#   refute(File.exist?(path), 'message')
#
#   # good
#   refute_path_exists(path)
#   refute_path_exists(path, 'message')
class RuboCop::Cop::Minitest::RefutePathExists < ::RuboCop::Cop::Base
  extend ::RuboCop::Cop::AutoCorrector

  def on_send(node); end
  def refute_file_exists(param0 = T.unsafe(nil)); end

  private

  def build_good_method(path, message); end
end

RuboCop::Cop::Minitest::RefutePathExists::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefutePathExists::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `refute_predicate`
# instead of using `refute(obj.a_predicate_method?)`.
#
# @example
#   # bad
#   refute(obj.one?)
#   refute(obj.one?, 'message')
#
#   # good
#   refute_predicate(obj, :one?)
#   refute_predicate(obj, :one?, 'message')
class RuboCop::Cop::Minitest::RefutePredicate < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  include ::RuboCop::Cop::Minitest::PredicateAssertionHandleable
  extend ::RuboCop::Cop::AutoCorrector

  private

  def assertion_type; end
end

RuboCop::Cop::Minitest::RefutePredicate::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefutePredicate::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Enforces the test to use `refute_respond_to(object, :do_something)`
# over `refute(object.respond_to?(:do_something))`.
#
# @example
#   # bad
#   refute(object.respond_to?(:do_something))
#   refute(object.respond_to?(:do_something), 'message')
#   refute(respond_to?(:do_something))
#
#   # good
#   refute_respond_to(object, :do_something)
#   refute_respond_to(object, :do_something, 'message')
#   refute_respond_to(self, :do_something)
class RuboCop::Cop::Minitest::RefuteRespondTo < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp
  include ::RuboCop::Cop::ArgumentRangeHelper
  extend ::RuboCop::Cop::MinitestCopRule
  extend ::RuboCop::Cop::AutoCorrector

  def autocorrect(corrector, node, arguments); end
  def on_send(node); end

  private

  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def peel_redundant_parentheses_from(arguments); end
end

RuboCop::Cop::Minitest::RefuteRespondTo::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Minitest::RefuteRespondTo::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

# Checks that `ensure` call even if `skip`. It is unexpected that `ensure` will be called when skipping test.
# If conditional `skip` is used, it checks that `ensure` is also called conditionally.
#
# On the other hand, it accepts `skip` used in `rescue` because `ensure` may be teardown process to `begin`
# setup process.
#
# @example
#
#   # bad
#   def test_skip
#   skip 'This test is skipped.'
#
#   assert 'foo'.present?
#   ensure
#   do_something
#   end
#
#   # bad
#   def test_conditional_skip
#   skip 'This test is skipped.' if condition
#
#   assert do_something
#   ensure
#   do_teardown
#   end
#
#   # good
#   def test_skip
#   skip 'This test is skipped.'
#
#   begin
#   assert 'foo'.present?
#   ensure
#   do_something
#   end
#   end
#
#   # good
#   def test_conditional_skip
#   skip 'This test is skipped.' if condition
#
#   assert do_something
#   ensure
#   if condition
#   do_teardown
#   end
#   end
#
#   # good
#   def test_skip_is_used_in_rescue
#   do_setup
#   assert do_something
#   rescue
#   skip 'This test is skipped.'
#   ensure
#   do_teardown
#   end
class RuboCop::Cop::Minitest::SkipEnsure < ::RuboCop::Cop::Base
  def on_ensure(node); end

  private

  def find_skip(node); end

  # @return [Boolean]
  def use_skip_in_rescue?(skip_method); end

  # @return [Boolean]
  def valid_conditional_skip?(skip_method, ensure_node); end
end

RuboCop::Cop::Minitest::SkipEnsure::MSG = T.let(T.unsafe(nil), String)

# Enforces that test method names start with `test_` prefix.
# It aims to prevent tests that aren't executed by forgetting to start test method name with `test_`.
#
# @example
#   # bad
#   class FooTest < Minitest::Test
#   def does_something
#   assert_equal 42, do_something
#   end
#   end
#
#   # good
#   class FooTest < Minitest::Test
#   def test_does_something
#   assert_equal 42, do_something
#   end
#   end
#
#   # good
#   class FooTest < Minitest::Test
#   def helper_method(argument)
#   end
#   end
class RuboCop::Cop::Minitest::TestMethodName < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::MinitestExplorationHelpers
  include ::RuboCop::Cop::VisibilityHelp
  include ::RuboCop::Cop::DefNode
  extend ::RuboCop::Cop::AutoCorrector

  def on_class(class_node); end

  private

  def class_elements(class_node); end

  # @return [Boolean]
  def offense?(node); end

  # @return [Boolean]
  def public?(node); end

  # @return [Boolean]
  def test_method_name?(node); end
end

RuboCop::Cop::Minitest::TestMethodName::MSG = T.let(T.unsafe(nil), String)

# Checks for `assert_raises` has an assertion method at
# the bottom of block because the assertion will be never reached.
#
# @example
#
#   # bad
#   assert_raises FooError do
#   obj.occur_error
#   assert_equal('foo', obj.bar) # Never asserted.
#   end
#
#   # good
#   assert_raises FooError do
#   obj.occur_error
#   end
#   assert_equal('foo', obj.bar)
class RuboCop::Cop::Minitest::UnreachableAssertion < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::MinitestExplorationHelpers

  def on_block(node); end
end

RuboCop::Cop::Minitest::UnreachableAssertion::MSG = T.let(T.unsafe(nil), String)

# Checks for a specified error in `assert_raises`.
#
# @example
#   # bad
#   assert_raises { raise FooException }
#   assert_raises('This should have raised') { raise FooException }
#
#   # good
#   assert_raises(FooException) { raise FooException }
#   assert_raises(FooException, 'This should have raised') { raise FooException }
class RuboCop::Cop::Minitest::UnspecifiedException < ::RuboCop::Cop::Base
  def on_block(block_node); end

  private

  # @return [Boolean]
  def unspecified_exception?(node); end
end

RuboCop::Cop::Minitest::UnspecifiedException::MSG = T.let(T.unsafe(nil), String)

# Provide a method to define offense rule for Minitest cops.
module RuboCop::Cop::MinitestCopRule
  # Define offense rule for Minitest cops.
  #
  # @example
  #   define_rule :assert, target_method: :match
  #   define_rule :refute, target_method: :match
  #   define_rule :assert, target_method: :include?, preferred_method: :assert_includes
  #   define_rule :assert, target_method: :instance_of?, inverse: true
  # @param assertion_method [Symbol] Assertion method like `assert` or `refute`.
  # @param target_method [Symbol] Method name offensed by assertion method arguments.
  # @param preferred_method [Symbol] An optional param. Custom method name replaced by
  #   autocorrection. The preferred method name that connects
  #   `assertion_method` and `target_method` with `_` is
  #   the default name.
  # @param inverse [Boolean] An optional param. Order of arguments replaced by autocorrection.
  def define_rule(assertion_method, target_method:, preferred_method: T.unsafe(nil), inverse: T.unsafe(nil)); end
end

# Helper methods for different explorations against test files and test cases.
module RuboCop::Cop::MinitestExplorationHelpers
  extend ::RuboCop::AST::NodePattern::Macros

  private

  # @return [Boolean]
  def assertion_method?(node); end

  def assertions(def_node); end
  def class_def_nodes(class_node); end

  # @return [Boolean]
  def lifecycle_hook_method?(node); end

  def lifecycle_hooks(class_node); end

  # @return [Boolean]
  def test_case?(node); end

  # @return [Boolean]
  def test_case_name?(name); end

  def test_cases(class_node); end

  # @return [Boolean]
  def test_class?(class_node); end
end

RuboCop::Cop::MinitestExplorationHelpers::ASSERTION_PREFIXES = T.let(T.unsafe(nil), Array)
RuboCop::Cop::MinitestExplorationHelpers::LIFECYCLE_HOOK_METHODS = T.let(T.unsafe(nil), Set)

# RuboCop minitest project namespace
module RuboCop::Minitest; end

RuboCop::Minitest::CONFIG = T.let(T.unsafe(nil), Hash)
RuboCop::Minitest::CONFIG_DEFAULT = T.let(T.unsafe(nil), Pathname)

# Because RuboCop doesn't yet support plugins, we have to monkey patch in a
# bit of our configuration.
module RuboCop::Minitest::Inject
  class << self
    def defaults!; end
  end
end

RuboCop::Minitest::PROJECT_ROOT = T.let(T.unsafe(nil), Pathname)

# This module holds the RuboCop Minitest version information.
module RuboCop::Minitest::Version
  class << self
    def document_version; end
  end
end

RuboCop::Minitest::Version::STRING = T.let(T.unsafe(nil), String)
RuboCop::NodePattern = RuboCop::AST::NodePattern
RuboCop::ProcessedSource = RuboCop::AST::ProcessedSource
RuboCop::Token = RuboCop::AST::Token