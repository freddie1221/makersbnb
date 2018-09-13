
require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'rake'

require './lib/account.rb'
require './lib/property.rb'

rake = Rake.application
rake.init
rake.load_rakefile

if ENV['RACK_ENV'] == 'test'
  set :database, "sqlite3:makersbnb_test.db.sqlite3"
  rake['db:setup'].invoke
else
  set :database, "sqlite3:makersbnb.db.sqlite3"
end

# requiring the routes
require './app/controllers/properties.rb'
require './app/controllers/login_logout.rb'
require './app/controllers/bookings.rb'

# requiring the models
require './app/models/account.rb'
require './app/models/property.rb'


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
