helpers do
  def get_current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end
end
#starts session for current user

# get '/songs' do
#   @current_user = get_current_user
#   if @current_user  
#     @user = @current_user.
#   else
#     @songs = Song.all
#   end
#   erb :'songs/index'
# end


get '/' do
  erb :index
end
#loads homepage

get '/profile' do
  erb :profile
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
    erb :'index' 
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
    @login_failed = false
  else
    @login_failed = true
    erb :'/login'
  end
end
#login

post '/logout' do
  session[:id] = nil
  redirect '/'
end

post '/profile' do

  @preference = get_current_user.preference
  if @preference.nil?
      @preference = Preference.create(user_id: session[:id].to_i,
      gender_pref: params[:gender_pref],
      age_range: params[:age_range],
      date_type:  params[:date_type])
  else
      @preference.update_attributes(user_id: session[:id].to_i, 
        gender_pref: params[:gender_pref], 
        age_range: params[:age_range], 
        date_type: params[:date_type]) 

  end
  erb :'/profile'
end

post '/activity' do
  @current_user = User.find(session[:id])
  @preferences = @current_user.preference
  erb :activity
end


  #logout