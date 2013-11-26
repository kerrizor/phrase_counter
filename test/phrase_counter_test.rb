require 'test_helper'
require './lib/phrase_counter.rb'
require 'mocha/setup'

class PhraseCounterTest < MiniTest::Unit::TestCase
  def setup
    @phrase_counter = PhraseCounter.new
    @text = 'Foo, bar! baz\'s "quote'
  end

  def test_counting_phrases_updates_the_phrase_hash
    assert_change(->{ @phrase_counter.phrases.dup }) do
      @text.each_line do |line|
        @phrase_counter.process_line(line)
      end

      @phrase_counter.final_tally
    end

    assert @phrase_counter.phrases.length == 2
  end

  def test_stripping_punctuation
    @phrase_counter.stubs(:sorted_phrases).returns([['foo bar baz', '42']])
    @phrase_counter.results_table.must_include "42 \t foo bar baz"
  end

  def test_similar_texts
    small_text = 'I love\nsandwiches'
    big_text   = '(I LOVE SANDWICHES!!)'
    small_phrase_counter = PhraseCounter.new

    small_text.each_line do |line|
      small_phrase_counter.process_line(line)
    end

    big_text.each_line do |line|
      @phrase_counter.process_line(line)
    end

    assert small_phrase_counter.phrases == @phrase_counter.phrases
  end
end

