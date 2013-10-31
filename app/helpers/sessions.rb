helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    # unless sessions[:user]
    #   return nil
    # else
    #   return sessions[:user][:id]

    return User.find(session[:user_id]) if session[:user_id]

  end

end
