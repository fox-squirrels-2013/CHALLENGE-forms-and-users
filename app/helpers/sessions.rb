helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    if session[:user]
      username = User.find_by_id(session[:user]).name
      p "#{username} is logged in!"
    else
      p "No user logged in currently."
    end
  end

end
