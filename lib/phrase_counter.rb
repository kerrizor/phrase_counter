class PhraseCounter
  attr_reader :phrases

  def initialize
    @phrases = {}
  end

  def count_phrases(text)
    text.prepare_text.each_cons(3) do |t|
      phrase = t.join(' ')
      @phrases[phrase] = phrases[phrase].nil? ? 1 : phrases[phrase] + 1
    end
  end

  def results_table
    table =  "Count \t Phrase\n"
    table << "------------------------------\n"

    sort_phrases.each do |tuple|
      table << "#{tuple[1]} \t #{tuple[0]}\n"
    end

    table
  end

  private

  def sort_phrases
    @phrases.sort { |a, b| a[1] <=> b[1] }.reverse.slice(0, 100)
  end
end
