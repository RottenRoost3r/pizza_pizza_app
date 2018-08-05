def crust_subtotal(pizza_crust)
	crust_subtotal_arr = []
	crust = "#{pizza_crust}"
	if crust == "pan crust" 
		crust_subtotal_arr << 0.50
	else 
		crust_subtotal_arr << 1.00
	end
	crust_subtotal_arr
end

def toppings(pizza_toppings)
	empty = []
	toppings_price = {"pepperoni" => 0.50, "sausage" => 0.50, "ham" => 0.75, "bacon" => 0.75, "pineapple" => 1.00, "extra cheese" => 1.00, "green peppers" => 0.25, "banana peppers" => 0.25, "mushrooms" => 0.25, "olives" => 0.25, "onions" => 0.25 }
	toppings_subtotal = 0
	eval(pizza_toppings).each  do |topping|
		toppings_subtotal = toppings_price.values_at(topping)
		empty << toppings_subtotal
	end
	empty
end

def size(pizza_size)
	size_array = []
	if pizza_size == "small"
		size_array << 5.00
	elsif pizza_size == "medium"
		size_array << 7.00
	else 
		size_array << 9.00
	end
	puts size_array
	size_array
end

def subtotal_array(pizza_toppings, pizza_crust)
	new_array = []
	new_array = toppings(pizza_toppings) << crust_subtotal(pizza_crust)
	new_array.flatten
end

def delivery(delivery_option)
	delivery_arr = []
	charge = 0
	if delivery_option == "delivery"
		charge += 5.00
	else 
		charge = 0.00
	end
	delivery_arr << charge
end

def final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option, pizza_size)
	final_hash = {}
	total_arr = []
	taxes = 0.06
	subtotal_arr = subtotal_array(pizza_toppings, pizza_crust)
	total_arr = subtotal_arr * pizza_quantity.to_f
	tax_and_delivery = (total_arr * taxes) + delivery(delivery_option)	
	total_arr << tax_and_delivery 
	my_size = size(pizza_size)
	total_arr << my_size
	total = total_arr.flatten.sum
	final_hash["pizza_quantity"] = pizza_quantity
	final_hash["pizza_size"] = pizza_size
	final_hash["pizza_crust"] = pizza_crust
	final_hash["pizza_toppings"] = pizza_toppings
	final_hash["delivery_option"] = delivery_option
	final_hash["total"] = total
	final_hash
end
