require 'sinatra'
require_relative 'pizza_app.rb'

enable :sessions

get '/' do
  
  erb :options
end



post '/pizza_options' do
	delivery_option = params[:delivery_option]
	pizza_size  = params[:pizza_size]
	pizza_quantity = params[:how_many]
	pizza_crust = params[:crust_type]
	pizza_toppings = params[:toppings].to_s
	street = params[:street]
	city = params[:city]
	state = params[:state]
	zip = params[:zip]
	redirect '/confirm_order?delivery_option=' + delivery_option + '&pizza_size=' + pizza_size + '&pizza_quantity=' + pizza_quantity + '&pizza_crust=' + pizza_crust + '&pizza_toppings=' + pizza_toppings + '&street' + street + '&city' + city + '&state' + state + '&zip' + zip 
end

get '/confirm_order' do
	total = final_total(params[:pizza_toppings], params[:pizza_crust], params[:pizza_quantity], params[:delivery_option], params[:pizza_size])
	street = params[:street]
	city = params[:city]
	state = params[:state]
	zip = params[:zip]
	p_quantity = total.values[0]
	p_size = total.values[1]
	p_crust = total.values[2]
	p_toppings = total.values[3]
	p_delivery = total.values[4]
	session[:p_total] = total.values[5]
	p "params at confirm are #{params}"
	erb :confirm, locals:{total: total, p_quantity: p_quantity, p_size: p_size, p_crust: p_crust, p_toppings: p_toppings, p_delivery: p_delivery, street: street, city: city, state: state, zip: zip} 
end

post '/confirm_order' do

end
