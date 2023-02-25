# typed: true
# frozen_string_literal: true

class Foot
  def cat
    1 +1
  end

  setup do
  end

  teardown do
  end

  describe "blah2" do
    it "hello" do
    end
    describe "blah3" do
      it 'hello3' do
      end
    end
  end

  it "hello it" do
  end

  it "one line"

  specify "hello specify" do
  end

  def foo
    2 + 2
  end

  private

  def my_private
  end
end
