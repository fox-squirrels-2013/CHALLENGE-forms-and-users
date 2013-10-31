set(:sess) do |role|
  condition 
end

get '/' do
  session["user"] ||= nil
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
# p params
# p params.fetch("user")
p session[:name] = params.fetch("user").fetch("name")
p session[:name]
# p "Nothing to see here"
  # sign-up a new user
    # erb :index
    erb :users
end

get '/session' do
  erb :sessions
end
