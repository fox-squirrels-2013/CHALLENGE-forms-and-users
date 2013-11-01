set(:sess) do |role|
  condition 
end

get '/' do
  # session[:user_id] ||= nil
  @users = User.all

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
  user = User.find_by_email(params[:user][:email])
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/'
  end

  erb :sign_in
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
p params
new_user = User.create(params.fetch("user"))
p session[:user_id] = new_user.id
# p "Nothing to see here"
  # sign-up a new user
    # erb :index
    erb :users
end

get '/session' do
  erb :sessions
end
