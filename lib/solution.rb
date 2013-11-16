require 'benchmark'
require_relative 'text_processor'
require_relative 'phrase_counter'

phrase_counter = PhraseCounter.new

ARGV.each do |filename|
  text = ''

  if File.exists?(filename)
    file = File.open(filename)

    file.each do |line|
      text << line.strip
    end
  end

  phrase_counter.count_phrases(text) unless text == ''
end

puts phrase_counter.results_table
