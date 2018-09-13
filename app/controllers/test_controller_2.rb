
class Makersbnb < Sinatra::Base

  get '/properties' do
    if is_logged_in? 
      erb :'properties/index', :layout => :layout_logged_in 
    else
      redirect '/session/new'
    end
  end

  get '/properties/new' do
    if is_logged_in?
      erb :'properties/new', :layout => :layout_logged_in
    else
      redirect '/session/new'
    end
  end

  post '/properties' do
    redirect '/properties'
  end

  get '/bookings' do
  end

  post '/bookings' do
  end


  def is_logged_in?
    current_user != nil
  end

  def current_user
    session[:user_id]
  end

  # run! if app_file == $0
end

