# Homepage (Root path)
get '/' do
  erb :index
end

#loads homepage

post '/new' do
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