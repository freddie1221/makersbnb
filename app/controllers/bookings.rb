
class Bookings < Sinatra::Base

  get '/bookings/:id' do
    @property = Property.find_by(id: params[:id].to_i)
    p @property
    erb :booking, :layout => :layout_logged_in
  end

  post '/bookings' do
  end

end
