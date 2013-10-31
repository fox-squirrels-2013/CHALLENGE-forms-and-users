get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  puts params
  user = User.find_by_email params[:user][:email]
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    flash[:success] = "Congrats! you have logged in, now you may never log out."
    redirect '/'
  else
    flash[:notice] = "Sorry, login failed."
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  flash[:success] = "You have been signed out. Goodbye."
  session.delete(:user_id)
  redirect '/'
  # sign-out  - use a partial with a form (no AJAX)
end

#----------- USERS -----------

get '/users/new' do

  # render sign-up page
  erb :sign_up
end

post '/users' do
  user = User.create(:name => params[:user][:name], :email => params[:user][:email],
                     :password => params[:user][:password])

  # sign-up a new user
end
