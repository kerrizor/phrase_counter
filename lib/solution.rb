require 'benchmark'
require_relative 'text_processor'
require_relative 'phrase_counter'

phrase_counter = PhraseCounter.new
text = ARGF.read

if text.empty?
  puts "Sorry, we couldn't find any content to process."
else
  phrase_counter.count_phrases(text)

  puts phrase_counter.results_table
end