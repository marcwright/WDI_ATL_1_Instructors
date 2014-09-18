class AccountsController < ApplicationController

  respond_to :json

  def index
    @accounts = Account.all
    respond_with @accounts, each_serializer: AccountSerializer
  end

end