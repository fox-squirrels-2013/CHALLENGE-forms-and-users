helpers do

  # goal is to use current_user like this:
  # current_user.name
  # current_user.email
  def current_user
    # TODO: return the current user if there is a user signed in.
    User.find_by_id(session[:user_id])
  end

  def get_user_from(data)
    user = User.where(:email => data[:email]).first
    session[:user_id] = user.id
    user
  end

  def create_user_from(data)
    user = User.create data
    session[:user_id] = user.id
    user
  end

  def user_is_authenticated(data)
    current_user.password == data[:password]
  end
end

