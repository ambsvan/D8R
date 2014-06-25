
get '/' do
  erb :index
end
#loads homepage

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
#starts session for current user

post '/' do
  @user = User.new(
    username: params[:username],
    password: params[:password],
    img:  params[:img],
    age: params[:age],
    gender: params[:gender]
    user_id: session[:user_id].to_i)
  if @user.save
    session[:user_id] = @users.id
    redirect '/' # need to redirect to next page
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
  @users = User.find_by(
    username: params[:username],
    password: params[:password])
  if @users
    session[:user_id] = @users.id
    redirect '/'
  else
    erb :'/login'
  end
end

#login

post '/logout' do
  session[:user_id] = nil
  redirect '/'
  end

  #logout