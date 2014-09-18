class DogesController < ApplicationController
  def index
    @doges = Doge.all
  end
end
