require 'benchmark'

class TextProcessor
  def self.strip_punctuation(text)
    text.gsub!(/[^0-9a-z ]/i, "")
  end
end

class PhraseCounter
  def self.results_table(phrase_array)
    table =  "Count \t Phrase\n"
    table << "------------------------------\n"

    phrase_array.each do |tuple|
      table << "#{tuple[1]} \t #{tuple[0]}\n"
    end

    table
  end
end

phrases = {}

ARGV.each do |filename|
  # check if file exists
  text = ""
  if File.exists?(filename)
    file = File.open(filename)

    file.each do |line|
      text << line.strip
    end
  end

  unless text == ""
    text = TextProcessor.strip_punctuation(text.downcase)

    array_of_words = text.split(' ')

    array_of_words.each_cons(3) do |t|
      phrase = t.join(" ")
      phrases[phrase] = phrases[phrase].nil? ? 1 : phrases[phrase] + 1
    end
  end
end

phrase_array = phrases.sort{ |a,b| a[1] <=> b[1] }.reverse.slice(0,100)

puts PhraseCounter.results_table(phrase_array)
