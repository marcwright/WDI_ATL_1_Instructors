class SessionsController < ApplicationController

  def new
  end

  def create
    #Find the user by email:
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_back_or(root_url)
    else
      flash[:error] = ["Your mother thinks you're a moronic cooter.", "I would kill you, but then the title of 'most fucking unattractive crack whore alive' would pass on to someone else.", "Get stabbed.", "In a couple weeks, you will be sucking a goat drilling Catholic for giggles in a dilapidated hardware store, you retard.", "Once upon a time there was a herpes ridden douche-fag. Surprise, it was you."].sample
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
