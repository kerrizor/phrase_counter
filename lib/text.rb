class Text
  attr_reader :text
  def initialize(text = '')
    @text = text.downcase
  end

  def prepare_text
    @text = strip_punctuation.split(' ')
  end

  private

  def strip_punctuation
    @text.gsub!(/[^0-9a-z ]/i, '')
  end
end
