class PostsController < ApplicationController

  def index
     word_frequencies = Post.word_frequencies
     render json: { word_frequencies: word_frequencies }
  end
end
