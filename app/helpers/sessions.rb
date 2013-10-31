helpers do

  def current_user
    return User.find(session["user"]) if session["user"]
    # TODO: return the current user if there is a user signed in.
  end

end
