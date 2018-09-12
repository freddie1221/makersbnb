require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:makersbnb.db.sqlite3"

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :home, :layout => :layout
  end

  get '/login' do
    erb :login
  end

  post '/logged_in' do
    session[:user] = Account.find_by(email: params[:email])
    puts params
    redirect '/properties'
  end

  post '/register' do
    Account.create({name: params[:name], email: params[:email]})
    session[:user] = Account.find_by(email: params[:email])
    puts params
    redirect '/properties'
  end

  get '/properties' do
    @name = $name
    erb :'properties/index', :layout => :layout_logged_in
  end

  get '/properties/new' do
    @name = $name
    erb :'properties/new', :layout => :layout_logged_in
  end

  post '/properties/book' do
    redirect '/properties'
  end

  get '/accounts' do
    @accounts = Account.all
    erb :accounts
  end
  run! if app_file == $0
end

require './lib/account.rb'
require './lib/property.rb'
