require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

require 'app/helpers'
require 'app/routes'

set :database, "sqlite3:makersbnb.db.sqlite3"

class Makersbnb < Sinatra::Base

  # What should this class do when it is called by rackup?
  # before, the only thing which app.rb did other than declare mthods was:
  run! if app_file == $0

end