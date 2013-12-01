class Post < ActiveRecord::Base

  def self.words
    self.all.flat_map(&:parse_body)
  end

  def parse_body
    body.strip.downcase.gsub(/[^a-zA-Z]/, '').split(' ')
  end

  def self.word_frequencies
    words.each_with_object(Hash.new(0)) { |word, freq| freq[word] += 1 }
  end
end
