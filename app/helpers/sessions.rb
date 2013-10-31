helpers do

  # goal is to use current_user like this:
  # current_user.name
  # current_user.email
  def current_user
    # TODO: return the current user if there is a user signed in.
    User.find(session[:user_id])
  end

end

