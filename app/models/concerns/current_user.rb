module CurrentUser
  def current_user
    if is_logged_in?
      User.find_by_id(session[:user_id])
    end
  end

  def is_logged_in?
    !!session[:user_id]
  end

end
