class AnagramsController < ApplicationController
  def index
  end

  def check_anagram
    s = params[:s]
    h = Hash.new
    s.chars.uniq.each { |x| h[x] = s.count(x).even? }
    render json: h.values.count(false) <= 1 ? 1 : 0
  end

  def nothing
    render nothing: true
  end
end
