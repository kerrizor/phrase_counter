class PhraseCounter
  attr_reader :phrases, :recent_words

  def initialize
    @phrases      = {}
    @recent_words = ['', '', '']
  end

  def tally(phrase)
    @phrases[phrase] = phrases[phrase].nil? ? 1 : phrases[phrase] + 1
  end

  def process_character(char)
    strip_newlines_from(char)

    return if char =~ /[^0-9a-z ]/i

    if char != ' '
      @recent_words[2] << char.downcase
    else
      tally(@recent_words.join(' ')) unless @recent_words.include? ''

      @recent_words.shift
      @recent_words << ''
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

  private

  def sorted_phrases
    @phrases.sort { |a, b| a[1] <=> b[1] }.reverse.slice(0, 10)
  end

  def strip_newlines_from(char)
    char.gsub!(/\n/, ' ')
  end
end
