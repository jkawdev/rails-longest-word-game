class PagesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    if (@word - @letters).empty?
      @answer = "Sorry, the letters of your #{@word} aren't similar with the grid #{@letters}"
    elsif @word
      @answer = "Your #{word} is not english"
    else
      @answer = "Very good answer!"
    end
  end
end
