require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:makersbnb.db.sqlite3"

class Makersbnb < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/accounts' do
    @accounts = Account.all
    erb :accounts
  end
  run! if app_file == $0
end

require './lib/account.rb'
