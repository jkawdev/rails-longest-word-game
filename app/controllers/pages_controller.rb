require "json"
require "open-uri"

class PagesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
    session[:letters] = @letters
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)


    @word = params[:word].chars
    @letters = session[:letters]
    if (@letters - @word).empty?
      @answer = "Sorry, the letters of your #{@word} aren't similar with the grid #{@letters}"
    elsif @word == word
      @answer = "Your #{params[:word]} is not english"
    else
      @answer = 'Very good answer!'
    end
  end
end
