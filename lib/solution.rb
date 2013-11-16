require 'benchmark'
require_relative 'text'
require_relative 'phrase_counter'

phrase_counter = PhraseCounter.new
text_object = Text.new(ARGF.read)

if text_object.text.empty?
  puts "Sorry, we couldn't find any content to process."
else
  phrase_counter.count_phrases(text_object)

  puts phrase_counter.results_table
end