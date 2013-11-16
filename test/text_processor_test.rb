require 'test_helper'
require './lib/text_processor.rb'

class SolutionTest < MiniTest::Unit::TestCase
  def setup
    @files = []
    @text = "Foo, bar! baz's \"quote"
  end

  def test_stripping_punctuation
    assert_equal "Foo bar bazs quote", TextProcessor.strip_punctuation(@text)
  end

  def test_preparing_text_returns_a_striped_and_downcased_array
    assert_equal %w(foo bar bazs quote), TextProcessor.prepare_text(@text)
  end
end