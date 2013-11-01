helpers do

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?

  end

end


    # TODO: return the current user if there is a user signed in.

=begin
current_user will check the session.id and will return the
User object for that id from the database.
=end


