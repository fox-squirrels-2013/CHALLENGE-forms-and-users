helpers do

  def current_user
    User.find(session[:user_id]).email
  end

end
