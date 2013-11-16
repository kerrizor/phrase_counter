require 'test_helper'
require './lib/text.rb'

class TextTest < MiniTest::Unit::TestCase
  def setup
    @files = []
    @text_object = Text.new("Foo, bar! baz's \"quote")
  end

  def test_preparing_text_returns_a_striped_and_downcased_array
    assert_equal %w(foo bar bazs quote), @text_object.prepare_text
  end
end