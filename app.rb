
require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

set :database, "sqlite3:makersbnb.db.sqlite3"

# requiring the routes
require './app/controllers/properties.rb'
require './app/controllers/login_logout.rb'
require './app/controllers/bookings.rb'

# requiring the models
require './app/models/account.rb'
require './app/models/property.rb'

# Would be interesting to think about what the class is doing in the app.rb file. BTW, I guess stuff
# Can be progressively added to classes.
class Makersbnb < Sinatra::Base
  use LoginLogout
  use Properties
  use Bookings
  # I'm gonna see what happens if I mount a new controller by using use
  #  it finds it...
  # I think it's because it needs to inherit config from Makers BNB
  configure do
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "app/views") }
    enable :sessions
  end
  # I don't yet have a complet understanding of what config does here - is it the same as in spec helpers?
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