require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:makersbnb.db.sqlite3"

class Makersbnb < Sinatra::Base
  get '/' do
    erb :home, :layout => :layout
  end

  get '/login' do
    erb :login
  end

  post '/logged_in' do
    $email = params[:email]
    $password = params[:password]

    puts params
    redirect '/properties'
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

  get '/accounts' do
    @accounts = Account.all
    erb :accounts
  end
  run! if app_file == $0
end

require './lib/account.rb'
require './lib/property.rb'
