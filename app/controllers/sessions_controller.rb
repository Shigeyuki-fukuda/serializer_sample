class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticated?(params[:password])
      session[:user_id] = user.id.to_s
      head :ok
    else
      head :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
