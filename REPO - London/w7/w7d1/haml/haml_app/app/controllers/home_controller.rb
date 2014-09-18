class HomeController < ApplicationController
  def index
    @text = "Hello, WDI!"
  end

  def index_haml
    @text = "Hello, WDI, from the HAML action!"
  end

end
