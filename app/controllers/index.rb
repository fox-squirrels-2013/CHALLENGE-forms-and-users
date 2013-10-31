get '/' do
  session["user"] ||= nil
  @all_members = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do

  erb :sign_in
end

post '/sessions' do

  @logged_in_user = User.where(email: params[:user][:email], password: params[:user][:password]) 
  session["user"] = @logged_in_user[0][:id]
  redirect '/'
end

post '/kill' do
  session["user"] = nil
end

delete '/sessions/:id' do

  # sign-out  - use a partial with a form (no AJAX)
end

#----------- USERS -----------

get '/users/new' do

  
  erb :sign_up
end

post '/users' do
  User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
  @user = User.where(name: params[:user][:name])
  session["user"] = @user[0][:id]
  redirect '/'
end
