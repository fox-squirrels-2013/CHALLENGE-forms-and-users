enable :sessions

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 if session[:user_id]
  erb :index
    # @users = User.all
  else
    erb :sign_in
  end
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  if User.exists? email: params["user"]["email"]
    @user = User.where(email: params["user"]["email"]).first
    if @user.password == params["user"]["password"]
      session[:user_id] = @user.id
    end
  end
  redirect '/'
end



delete '/sessions/:id' do

  # sign-out  - use a partial with a form (no AJAX)
end

#----------- USERS -----------

get '/users/new' do

  # render sign-up page
  erb :sign_up
end

post '/users' do
  @user = User.create name: params["user"]["name"],
                      email: params["user"]["email"],
                      password: params["user"]["password"]
  session[:user_id] = @user.id
  redirect '/'
end

get '/logout' do
  session.clear
  erb :test
end


get '/test' do
  erb :test
end
