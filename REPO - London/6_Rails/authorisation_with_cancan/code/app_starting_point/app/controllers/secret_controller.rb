class SecretController < ApplicationController
  before_filter :authenticate

  def index
    render text: "Shhhh! it's a sea-kwet!"
  end

  def really_secret
    render text: "DO NOT TALK ABOUT WDI CLUB!"
  end

end
