helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    if session.empty?
      return nil
    else
      return User.find(session[:user_id])
    end
  end

end
