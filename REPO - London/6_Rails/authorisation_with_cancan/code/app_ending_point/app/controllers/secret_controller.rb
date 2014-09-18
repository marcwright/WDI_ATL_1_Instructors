class SecretController < ApplicationController
  def index
    authorize! :read, :secret
  end

  def really_secret
    authorize! :read, :really_secret
  end
end
