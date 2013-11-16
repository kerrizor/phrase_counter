require 'test_helper'
require './lib/phrase_counter.rb'
require 'mocha/setup'

class PhraseCounterTest < MiniTest::Unit::TestCase
  def setup
    @phrase_counter = PhraseCounter.new
    @phrases = [['foo bar baz', '42']]
    @text = Text.new('Foo, bar! baz\'s "quote')
  end

  def test_counting_phrases_updates_the_phrase_hash
    assert_change(->{ @phrase_counter.phrases.dup }) do
      @phrase_counter.count_phrases(@text)
    end

    assert @phrase_counter.phrases.length == 2
  end

  def test_stripping_punctuation
    @phrase_counter.stubs(:sort_phrases).returns(@phrases)
    @phrase_counter.results_table.must_include "42 \t foo bar baz"
  end
end

