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
  user = User.create params[:user]
  session[:user_id] = user.id
  # sign-up a new user
  "welcome new user: #{current_user.name}!"
end

#"session_id"=>"ddf63b23656765c4b093f5550200723bedd62e0157dec895ecc3d2a46199a08a", "tracking"=>{"HTTP_USER_AGENT"=>"98165fd680503272a3708d21632722a1dbff40ca", "HTTP_ACCEPT_ENCODING"=>"ed2b3ca90a4e723402367a1d17c8b28392842398", "HTTP_ACCEPT_LANGUAGE"=>"66eae971492938c2dcc2fb1ddc8d7ec3196037da"}, "csrf"=>"a30b950d40834cb3e5469ecda494b9c9b61413cbb79880fa0698cd088b03767c", "user_id"=>1}
