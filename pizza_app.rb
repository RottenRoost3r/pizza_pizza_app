# pizza_toppings = ["pepperoni", "sausage"]
#  pizza_crust = "hand tossed"
#   pizza_quantity = 1
#   delivery_option = "delivery"

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
#p "crust subtotal is #{crust_subtotal(pizza_crust)}"

# def pizza_toppings_split(pizza_toppings) ####I need to do a regex here to take out any punctuation such as commas that user may input************************
# 	pizza_toppings.split
# end
# p "pizza toppings split is #{pizza_toppings_split(pizza_toppings)}"

def toppings(pizza_toppings)
	puts "pizza_toppings is #{pizza_toppings} and its class is #{pizza_toppings.class}"
	empty = []
	#pizza_toppings = "#{pizza_toppings}"
	toppings_price = {"pepperoni" => 0.50, "sausage" => 0.50, "ham" => 0.75, "bacon" => 0.75, "pineapple" => 1.00, "extra cheese" => 1.00, "green peppers" => 0.25, "banana peppers" => 0.25, "mushrooms" => 0.25, "olives" => 0.25, "onions" => 0.25 }
	toppings_subtotal = 0
	eval(pizza_toppings).each  do |topping|
		toppings_subtotal = toppings_price.values_at(topping)
		empty << toppings_subtotal
	end
	empty
	 # p "toppings are #{toppings(pizza_toppings)}"
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
	puts "pizza_toppings is #{pizza_toppings} and pizza_crust is #{pizza_crust}"
	new_array = []
	new_array = toppings(pizza_toppings) << crust_subtotal(pizza_crust)
	puts "new_array is #{new_array} in subtotal_array"
	new_array.flatten
	# p "subtotal_array is #{subtotal_array(pizza_toppings, pizza_crust)}"
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

#p "delivery charge is #{delivery(delivery_option)}"

def final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option, pizza_size)
	final_hash = {}
	puts "in final total pizza_toppings is #{pizza_toppings}"
	total_arr = []
	taxes = 0.06
	puts "pizza_quantity is #{pizza_quantity}"
	subtotal_arr = subtotal_array(pizza_toppings, pizza_crust)
	puts "subtotal_arr #{subtotal_arr}"
	total_arr = subtotal_arr * pizza_quantity.to_f
	p "total_arr is #{total_arr}"
	tax_and_delivery = (total_arr * taxes) + delivery(delivery_option)
	# p "#{total_arr * taxes}"
	# p "tax worksheet is #{tax_and_delivery}"
	# puts "pizza size is #{size} and its class is #{size.class}"	
	total_arr << tax_and_delivery 
	my_size = size(pizza_size)
	total_arr << my_size

	puts "in final_total total_arr is #{total_arr} class is #{total_arr.class}"
	total = total_arr.flatten.sum
	final_hash["pizza_quantity"] = pizza_quantity
	final_hash["pizza_size"] = pizza_size
	final_hash["pizza_crust"] = pizza_crust
	final_hash["pizza_toppings"] = pizza_toppings
	final_hash["delivery_option"] = delivery_option
	final_hash["total"] = total
	final_hash
	#{}"#{total_arr + tax_and_delivery}"
	# p "I have your order as #{pizza_quantity} #{pizza_crust} pizza(s) with #{pizza_toppings} for #{delivery_option}.  Your total is $#{total}, with tax.  Thank you for your order!"
end
#p final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)
#line 61 (and down) is where it starts giving me issues, everything else works right
#p "final total is #{final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)}"