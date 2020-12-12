class ApplicationController < ActionController::Base
  # helpers/application_helper.rb に定義するのと同義
  helper_method :current_user

  def auth_filter
    redirect_to :root unless current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||=
        User.find_by(id: session[:user_id])
    end
  end
end
