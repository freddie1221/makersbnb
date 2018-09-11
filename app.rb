require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

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

    account = Account.find_by(email: params[:email])
    correct_password = BCrypt::Password.new(account.password)
    if correct_password.is_password?(params[:password])
      session[:user] = account
      redirect '/properties'
    else
      'PASSWORD REJECTED'
    end

  end

  post '/register' do
    password = BCrypt::Password.create(params[:password])
    Account.create({name: params[:name], email: params[:email], password: password})
    session[:user] = Account.find_by(email: params[:email])
    
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

  get '/accounts' do
    @accounts = Account.all
    erb :accounts
  end
  run! if app_file == $0
end

require './lib/account.rb'
require './lib/property.rb'
