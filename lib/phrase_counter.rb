class PhraseCounter
  attr_reader :phrases, :words_list

  def initialize
    @phrases = {}
    reset_words_list
  end

  def process_line(line)
    line = line.downcase.gsub(/\\n/, ' ')

    words = line.gsub(/[^0-9a-z ]/i, '').split(' ')#.map(&:to_sym)

    words.each do |word|
      @words_list.shift
      @words_list << word

      tally_word
    end
  end

  def results_table
    table =  "Count \t Phrase\n"
    table << "------------------------------\n"

    sorted_phrases.each do |tuple|
      table << "#{tuple[1]} \t #{tuple[0]}\n"
    end

    table
  end

  def final_tally
    tally_word
    reset_words_list
  end

  private

  def reset_words_list
    @words_list = ['', '', '']
  end

  def tally_word
    unless @words_list.include? ''
      phrase = @words_list.join(' ')
      @phrases[phrase] = phrases[phrase].nil? ? 1 : phrases[phrase] + 1
    end
  end

  def sorted_phrases
    @phrases.sort { |a, b| a[1] <=> b[1] }.reverse.slice(0, 100)
  end
end
