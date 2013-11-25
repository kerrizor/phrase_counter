require 'benchmark'
require_relative 'text'
require_relative 'phrase_counter'

phrase_counter = PhraseCounter.new

ARGF.each_char do |char|
  phrase_counter.process_character(char)
end

if phrase_counter.phrases.empty?
  puts "Sorry, we couldn't find any content to process."
else
  puts phrase_counter.results_table
end

# TODO
#
# Problems
# + stripping punctuation without look-ahead/behind
# + how do we handle hyphenated words that span lines?
