# typed: false
# frozen_string_literal: true

class Foo
  ABC = 2
  def my_method
    foo = 1
    bar = 2
    foo + bar
  end

  def bar
  end

  def another_method
    my_method
  end
end
