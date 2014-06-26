helpers do
  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end
end
#starts session for current user


get '/' do
  erb :index
end
#loads homepage

get '/profile' do
  erb :'profile'
end

post '/' do
  @user = User.new(
    # id: session[:id].to_i),
    username: params[:username],
    password: params[:password],
    img:  params[:img],
    age: params[:age],
    gender: params[:gender],
    bio: params[:bio]
  )
  if @user.save
    session[:id] = @user.id
    redirect '/profile'
  else
    erb :'/' 
  end
end

# Creates a new user and adds to database
# Reloads the page, need to implement redirect

get '/login' do
  erb :'login'
end

post '/login' do
  @user = User.find_by(
    username: params[:username],
    password: params[:password])
  if @user
    session[:id] = @user.id
    redirect '/profile'
  else
    erb :'/login'
  end
end
#login

post '/logout' do
  session[:id] = nil
  redirect '/'
end

  #logout