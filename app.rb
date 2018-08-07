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
	pizza_sauce = params[:pizza_sauce]
	pizza_toppings = params[:toppings].to_s
	street = params[:street]
	city = params[:city]
	state = params[:state]
	zip = params[:zip]
	p"params in options are #{params}"
	redirect '/confirm_order?delivery_option=' + delivery_option + '&pizza_sauce=' + pizza_sauce + '&pizza_size=' + pizza_size + '&pizza_quantity=' + pizza_quantity + '&pizza_crust=' + pizza_crust + '&pizza_toppings=' + pizza_toppings + '&street=' + street + '&city=' + city + '&state=' + state + '&zip=' + zip 
end

get '/confirm_order' do
	p "params in confirm post are #{params}"
	total = final_total(params[:pizza_toppings], params[:pizza_crust], params[:pizza_quantity], params[:delivery_option], params[:pizza_size], params[:pizza_sauce])
	street = params[:street]
	city = params[:city]
	state = params[:state]
	zip = params[:zip]
	session[:delivery] = params[:delivery_option]
	session[:size] = params[:pizza_size]
	session[:quantity] = params[:pizza_quantity]
	session[:crust] = params[:pizza_crust]
	session[:sauces] = params[:pizza_sauce]
	p " WHAAAAAAAAT, WHY?!?! #{session[:quantity]}, #{session[:crust]}, #{session[:topppings]}"
	p_quantity = total.values[0]
	p_size = total.values[1]
	p_crust = total.values[2]
	p_toppings = total.values[3]
	p_delivery = total.values[4]
	p_sauce = total.values[5]
	toppings = eval(p_toppings)
	session[:p_total] = total.values[6]
	session[:topppings] = eval(p_toppings)
	erb :confirm, locals:{total: total, p_quantity: p_quantity, p_sauce: p_sauce, delivery: session[:delivery], size: session[:size], sauces: session[:sauces], quantity: session[:quantity], crust: session[:crust], topppings: session[:topppings], p_size: p_size, p_crust: p_crust, toppings: toppings, p_delivery: p_delivery, street: street, city: city, state: state, zip: zip} 
end

post '/confirm' do
	confirm_quantity = params[:confirm_quantity]
	confirm_size = params[:confirm_size]
	confirm_crust = params[:confirm_crust]
	confirm_topping = params[:confirm_topping]
	confirm_delivery = params[:confirm_delivery]
	confirm_sauce = params[:confirm_sauce]
	street = params[:street]
	city = params[:city]
	state = params[:state]
	zip = params[:zip]
	p "params in confirm are #{params}"
	confirm_arr = []
	confirm_arr << confirm_quantity << confirm_size << confirm_crust << confirm_topping << confirm_delivery << confirm_sauce
	confirm_arr.uniq!
	confirm_arr.each do |confirmation|
		if confirm_arr.length == 2
			redirect '/pizza_options'
		else confirm_arr.length == 1
			if confirmation == "no"
				redirect '/pizza_options'
			else
				redirect '/total_page?street=' + street + '&city=' + city + '&state=' + state + '&zip=' + zip 
			end
		end
	end
end

get '/pizza_options' do
	erb :options
end

get '/total_page' do
	p_total = session[:p_total]
	street = params[:street]
	city = params[:city]
	state = params[:state]
	zip = params[:zip]
	delivery = session[:delivery]
	size = session[:size]
	quantity = session[:quantity]
	crust = session[:crust]
	topppings = session[:topppings]
	sauces = session[:sauces]
	p "params in total are #{params}"
	p " WHAAAAAAAAT, WHY?!?! #{session[:quantity]}, #{session[:crust]}, #{session[:topppings]}"
	erb :total, locals:{p_total: p_total, delivery: delivery, size: size, quantity: quantity, sauces: sauces, crust: crust, topppings: topppings, street: street, city: city, state: state, zip: zip}
end

post '/total_page' do

	redirect '/total'
end
