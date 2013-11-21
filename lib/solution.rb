require 'benchmark'
require_relative 'text'
require_relative 'phrase_counter'

phrase_counter = PhraseCounter.new
words = ['', '', '']

ARGF.each_char do |char|
  char.gsub!(/\n/, ' ')
  next if char =~ /[^0-9a-z ]/i

  if char != " "
    words[2] << char.downcase
  else
    phrase_counter.count(words.join(' ')) unless words.include? ''

    words.shift
    words << ''
  end
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
