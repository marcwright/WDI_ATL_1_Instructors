class ToysController < ApplicationController

  def index
    @toys = Dog.find(params["dog_id"]).toys
  end

end
