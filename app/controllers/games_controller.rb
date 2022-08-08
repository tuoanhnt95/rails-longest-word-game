require 'json'
require 'open-uri'
require 'time'

class GamesController < ApplicationController
  def new
    # display random grid
    alphabets = ('a'..'z').to_a
    @letters = []
    10.times { @letters << alphabets.sample }
    @start_time = Time.now
  end

  def valid_grid?(user_array, letters)
    user_array.all? { |letter| letters.include?(letter) }
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    JSON.parse(URI.open(url).read)
  end

  def check_score(word, time)
    word.length - (time / 10)
  end

  def score
    @time = Time.now - Time.parse(params[:start_time])
    @user_word = params[:new]
    @letters = params[:letters].split(' ')
    @valid_grid = valid_grid?(@user_word.split(''), @letters)
    @english_word = english_word?(@user_word)['found']
    @score = check_score(@user_word, @time)
    # session[:current_score] += @score
  end
end
