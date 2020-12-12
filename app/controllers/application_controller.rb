class ApplicationController < ActionController::Base
  # helpers/application_helper.rb に定義するのと同義
  helper_method :current_user

  private

  def current_user
    if session[:user_id]
      @current_user ||=
        User.find_by(id: session[:user_id])
    end
  end
end
