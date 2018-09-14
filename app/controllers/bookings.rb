
class Bookings < Sinatra::Base

  get '/bookings/:id' do
    @property = Property.find_by(id: params[:id].to_i)
    erb :booking, :layout => :layout_logged_in
  end

  post '/bookings/:id' do
    booking = { account_id: session[:user_id], property_id: params[:id], date: params[:bookingdate], confirmed: false }
    Booking.create(booking)
    redirect '/properties'
  end

end
