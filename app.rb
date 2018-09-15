
require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'rake'
require 'pg'


# class Makersbnb < Sinatra::Base
#   get '/' do
#     'Goodbye world!'
#   end
# end

# I'm fairly sure this is all just config. Perhaps we aren't setting env properly
# requiring the routes
require './app/controllers/properties.rb'
require './app/controllers/login_logout.rb'
require './app/controllers/bookings.rb'

# requiring the models
require './app/models/account.rb'
require './app/models/property.rb'
require './app/models/booking.rb'

# It looks like this Rake job is failing. The rakefile has nothing in it. Yep, that was causing the failure
# rake = Rake.application
# rake.init
# rake.load_rakefile

if ENV['RACK_ENV'] == 'test'
  set :database, {
    adapter: 'postgresql',  
    encoding: 'unicode', 
    database: 'makersbnb_postrgres_test_db', 
    pool: 5
    }
  
  rake['db:setup'].invoke
else
  set :database, {
    adapter: 'postgresql',  
    encoding: 'unicode', 
    database: 'postgresql-spherical-68068', 
    pool: 5
    }
end


class Makersbnb < Sinatra::Base
  use LoginLogout
  use Properties
  use Bookings
  
  configure do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "app/views") }
    enable :sessions
  end
end

class LoginLogout < Sinatra::Base
  configure do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "app/views") }
    enable :sessions
  end
end

class Properties < Sinatra::Base
  configure do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "app/views") }
    enable :sessions
  end
end

class Bookings < Sinatra::Base
  configure do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "app/views") }
    enable :sessions
  end
end
