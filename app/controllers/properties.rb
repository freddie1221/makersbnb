
class Properties < Sinatra::Base


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
    property = {name: params[:name], description: params[:description], price: params[:price_per_night].to_i, account_id: session[:user_id]}
    Property.create(property)
    redirect '/properties'
  end
  
end


