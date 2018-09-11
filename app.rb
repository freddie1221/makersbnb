require 'sinatra/base'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :home, :layout => :layout 
  end

  post '/register' do
    $name = params[:name]
    $email = params[:email]

    puts params
    redirect '/properties'
  end

  get '/properties' do
    @name = $name
    erb :properties
  end

  run! if app_file == $0
end