
require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

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

  # What should this class do when it is called by rackup?
  # before, the only thing which app.rb did other than declare methods was:
  
  # run! if app_file == $0
  # I think this ^ is what is called by rackup. Nope. 
  
  # I think there can be some more config in here
  configure do
    
    set :database, "sqlite3:makersbnb.db.sqlite3"
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { File.join(root, "app/views") }

  end
  # using configure with a block in this way was copied from the structuring sinatra site
  

end