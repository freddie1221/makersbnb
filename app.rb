require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'rake'

rake = Rake.application
rake.init
rake.load_rakefile


if ENV['RACK_ENV'] == 'test'
  set :database, "sqlite3:makersbnb_test.db.sqlite3"
  rake['db:setup'].invoke
else
  set :database, "sqlite3:makersbnb.db.sqlite3"
end

class Makersbnb < Sinatra::Base
  enable :sessions

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
    correct_password = BCrypt::Password.new(account.password)
    if correct_password.is_password?(params[:password])
      session[:user_id] = account.id
      redirect '/properties'
    else
      'PASSWORD REJECTED'
    end
  end

  get '/properties' do
    redirect '/session/new' unless is_logged_in?
    @properties = Property.all
    erb :'properties/index', :layout => :layout_logged_in
  end

  get '/properties/new' do
    redirect '/session/new' unless is_logged_in?
    erb :'properties/new', :layout => :layout_logged_in
  end

  post '/properties' do
    # Store property in database
    property = {name: params[:name], description: params[:description], price: params[:price_per_night].to_i, account_id: session[:user_id]}
    Property.create(property)
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

  run! if app_file == $0
end

require './lib/account.rb'
require './lib/property.rb'
