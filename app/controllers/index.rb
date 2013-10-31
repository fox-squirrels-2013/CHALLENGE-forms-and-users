get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do

  # sign-in
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
  @name = params["user"]["name"]
  @email= params["user"]["email"]
  @password = params["user"]["password"]
  @new_user = User.create(:name => @name, :email => @email, :password => @password)
  session[:user_id] = @new_user.id
  p session
  redirect '/sessions/new'
  # sign-up a new user
end