require './solution.rb'
require 'minitest/autorun'
require 'minitest/pride'

class SolutionTest < MiniTest::Test
  def setup
    @files = []
    @text = "Foo, bar! baz's \"quote"
  end

  def test_stripping_punctuation
    assert_equal "Foo bar bazs quote", TextProcessor.strip_punctuation(@text)
  end
end