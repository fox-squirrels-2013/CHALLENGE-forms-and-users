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

delete '/sessions/:id' do
  session["user"] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do

  
  erb :sign_up
end

post '/users' do
  User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
  @user = ['placeholder']
  @user[0] = User.where(name: params[:user][:name])
  unless @user = []
    session["user"] = @user[0][:id]
   redirect '/'
  else
    flash[:error] = User.flash_presence_validation_error
    # redirect '/users/new'
  end
end
