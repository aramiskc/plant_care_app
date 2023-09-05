class SessionsController < ApplicationController
  def new
    render template: "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to "/"
  end
end
