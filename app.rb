require 'sinatra/base'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :home, :layout => :layout
  end

  get '/login' do
    erb :login
  end

  post '/register' do
    $name = params[:name]
    $email = params[:email]

    puts params
    redirect '/properties'
  end

  get '/properties' do
    @name = $name
    erb :properties, :layout => :layout_logged_in
  end

  run! if app_file == $0
end
