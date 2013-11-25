class PhraseCounter
  attr_reader :phrases, :recent_words

  def initialize
    @phrases      = {}
    reset_recent_words_array
  end

  def process_character(char)
    strip_newlines_from(char)

    return if char =~ /[^0-9a-z ]/i

    if char != ' '
      @recent_words[2] << char.downcase
    else
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
    reset_recent_words_array
  end

  private

  def reset_recent_words_array
    @recent_words = ['','','']
  end

  def tally_word
    unless @recent_words.include? ''
      phrase = @recent_words.join(' ')
      @phrases[phrase] = phrases[phrase].nil? ? 1 : phrases[phrase] + 1
    end

    @recent_words.shift
    @recent_words << ''
  end

  def sorted_phrases
    @phrases.sort { |a, b| a[1] <=> b[1] }.reverse.slice(0, 100)
  end

  def strip_newlines_from(char)
    char.gsub!(/\n/, ' ')
  end
end
