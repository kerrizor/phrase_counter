class TextProcessor
  def self.prepare_text(text)
    processed_text = strip_punctuation(text.downcase)
    processed_text.split(' ')
  end

  private

  def self.strip_punctuation(text)
    text.gsub!(/[^0-9a-z ]/i, '')
  end
end
