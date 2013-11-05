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
  # params[:user][:email]
  p params[:user][:password]
  p user = User.where(name: "Dom")
  p user.take!

  # if params[:user][:password]==User.where(name: "Dom").password.take
  #   redirect '/'
  # else
  #   redirect '/sessions'
  # end
end

# params[:user] => {}[:email] => email@

# 3.2 find_by_email params[:user][:email]
# 4.0 find_by email: params[:user][:email]

delete '/sessions/:id' do
  # sign-out  - use a partial with a form (no AJAX)
end

#----------- USERS -----------

get '/users/new' do

  # render sign-up page
  erb :sign_up
end

post '/users' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/sessions/new'
  # sign-up a new user
end

# hrgbkjw
