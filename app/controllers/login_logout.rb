
class LoginLogout < Sinatra::Base

  get '/' do
    erb :home, :layout => :layout
  end

  post '/' do
    password = BCrypt::Password.create(params[:password])
    Account.create({name: params[:name], email: params[:email], password: password})
    session[:user_id] = Account.find_by(email: params[:email]).id
    redirect '/properties'
  end

  get '/session/new' do
    erb :login
  end

  get '/logout' do
    session.clear
    redirect '/session/new'
  end

  post '/session' do
    account = Account.find_by(email: params[:email])
    if account == nil
      'Account not found!'
    else 
      correct_password = BCrypt::Password.new(account.password)
      if correct_password.is_password?(params[:password])
        session[:user_id] = account.id
        redirect '/properties'
      else
        'PASSWORD REJECTED'
      end
    end
  end


end