require './config/environment.rb'


get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 @all_users = User.all
 p @all_users
 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  if User.find_by_email(params[:user][:email]).password == params[:user][:password]
    session[:user] = User.find_by_email(params[:user][:email]).id
    erb :list
  else
    erb :not_a_user
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
  p '9'*80
  p params
  User.create!(params[:user])
  # p @user_list = User.all  
  erb :sign_in
end
