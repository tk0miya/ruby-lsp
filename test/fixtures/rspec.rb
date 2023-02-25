# typed: true
# frozen_string_literal: true

class Boot
end

RSpec.describe(Loott) do
  it "hello" do
  end
end

before do
  1 + 1
end

describe(Foot) do
  def cat
    1 +1
  end

  # missing
  subject { Widget.new }

  # FIXME: this is missing
  setup do
  end

  teardown do
  end

  before do
  end

  #missing
  before(:each) do
  end

  #missing
  #before(:all) do
  #end

  # before(:any_symbol) do
  # end
  #
  # before('string') do
  # end

  after do
  end

  it { is_expected.to be_empty }

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
