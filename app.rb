require 'sinatra/base'

class Makersbnb < Sinatra::Base
  get '/' do
    erb :home, :layout => :layout 
  end

  post '/register' do
    redirect '/helloworld'
  end

  get '/helloworld' do
    'hello world'
  end

  run! if app_file == $0
end