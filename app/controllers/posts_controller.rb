class PostsController < ApplicationController

  def index
     word_frequencies = Post.word_frequencies.to_a
     words = word_frequencies.map(&:first)
     frequencies = word_frequencies.map(&:last)
     render json: { words: words, frequencies: frequencies }
  end
end
