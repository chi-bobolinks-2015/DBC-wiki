module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def is_admin?
    if current_user.admin
      return true
    else
      return false
    end
  end
end
