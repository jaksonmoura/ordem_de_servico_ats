module ApplicationHelper
  def logged_in?
     !session[:logged].nil?
  end

  def current_user
    User.find(session[:user_id])
  end
end
