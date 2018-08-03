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
	p "params in pizza options are #{params}"
	redirect '/total_page?delivery_option=' + delivery_option + '&pizza_size=' + pizza_size + '&pizza_quantity=' + pizza_quantity + '&pizza_crust=' + pizza_crust + '&pizza_toppings=' + pizza_toppings + '&street' + street + '&city' + city + '&state' + state + '&zip' + zip 
end

get '/total_page' do
	p "params in total #{params}"
	total = final_total(params[:pizza_toppings], params[:pizza_crust], params[:pizza_quantity], params[:delivery_option], params[:pizza_size])
	street = params[:street]
	city = params[:city]
	state = params[:state]
	zip = params[:zip]
	p "total is #{total}"
		erb :total, locals:{total: total, street: street, city: city, state: state, zip: zip} 
end


#*********************8need to work on getting the string of [pizza_toppings] back into an array to proceed with rest of code