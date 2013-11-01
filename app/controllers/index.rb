enable :sessions

get '/' do
  @users = User.all
  erb :index do
    erb :display_users do erb :sign_out end
  end
end

#----------- SESSIONS -----------

get '/sessions/new' do
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
  session.delete(:user_id)
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  u = User.create(params[:user])
  session[:user_id] = u.id
  redirect '/'
end