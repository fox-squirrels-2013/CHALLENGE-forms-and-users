enable :sessions

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  # @user_id = session[:user_id]
  @users = User.all
    erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # sessions[:user_id] = params
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  u = User.where('email = ?', params[:user][:email]).first

  if !u.nil? && params[:user][:password] == u.password
    session[:user_id] = u.id
    redirect '/'
  else
    'get the fuck out of here, dude'
  end
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
  u = User.create(params[:user])
  session[:user_id] = u.id
  redirect '/'
end