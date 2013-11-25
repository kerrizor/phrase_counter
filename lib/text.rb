class Text
  attr_reader :text
  def initialize(text = '')
    @text = text.downcase.gsub(/\n/, ' ')
  end

  def prepare_text
    @text = strip_punctuation.split(' ')
  end

  def self.strip_newlines_from(char)
    char.gsub!(/\n/, ' ')
  end

  private

  def strip_punctuation
    @text.gsub(/[^0-9a-z ]/i, '')
  end
end
