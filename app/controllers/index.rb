get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  user = get_user_from(params[:user])
  
  if user
    if user_is_authenticated(params[:user])
      redirect '/'
    else
      # bad password path
    end
  else
    # user not found path
  end
end

# delete '/sessions/1' do
delete '/sessions/:id' do

  # sign-out  - use a partial with a form (no AJAX)
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  user = create_user_from(params[:user])
  # sign-up a new user
  "welcome new user: #{current_user.name}!"
end
