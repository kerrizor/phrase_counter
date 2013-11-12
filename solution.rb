=begin
The program accepts as arguments a list of one or more file paths (e.g. `./solution.rb file1.txt file2.txt ...`).
The program also accepts input on stdin (e.g. `cat file1.txt | ./solution.rb`).
The program outputs a list of the 100 most common three word sequences in the text, along with a count of how many times each occurred in the text.
  For example:
    231 - i will not
    116 - i do not
    105 - there is no
    54 - i know not
    37 - i am not
    ...
The program ignores punctuation, line endings, and is case insensitive (e.g. "I love\nsandwiches." should be treated the same as "(I LOVE SANDWICHES!!)")
The program is capable of processing large files and runs as fast as possible.
You should push to GitHub at least three times.
=end

require 'benchmark'

phrases = {}

ARGV.each do |filename|
  # check if file exists
  file = File.open(filename)

  text = ""
  file.each do |line|
    text << line.strip
  end

  text = text.gsub!(/[^0-9a-z ]/i, "")

  text = text.split(' ')

  text.each_cons(3) do |t|
    phrase = t.join(" ")
    phrases[phrase] = phrases[phrase].nil? ? 1 : phrases[phrase] + 1
  end
end

phrase_array = phrases.sort{ |a,b| a[1] <=> b[1] }.reverse.slice(0,100)

puts "Count \t Phrase"
puts "------------------------------"
phrase_array.each do |tuple|
  puts "#{tuple[1]} \t #{tuple[0]}"
end
