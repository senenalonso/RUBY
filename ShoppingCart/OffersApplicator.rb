require_relative 'PriceList'

class OffersApplicator
	def initialize
    @price_list = PriceList.get_price_list
		@offers = {}	
	end

	def add_offer(fruit, offer)
		@offers[fruit] = offer		
	end

	def apply_apples_2x1(qty)
		puts "Buy 2 apples and pay just one!"
		qty%2 == 0 ? qty/2*@price_list[:apple] : (qty/2)+1*PriceList.price_list[:apple] 			
	end

	def apply_oranges_3x2(qty)
		puts "Buy 3 oranges and pay just 2!"
		puts (qty/3)+1
		qty%3 == 0 ? qty/3*@price_list[:orange] : qty%3 == 1 ? (qty/3)+1*@price_list[:orange] : (qty/3)+2*@price_list[:orange] 			
	end

	def apply_banana_free_for_4_grapes
		puts "Buy 4 grapes you get one banana for free if you want!"
	end	

	def apply_offers(products)
			@offers.each do |fruit, offer| 
				if products.key?(fruit.to_sym)	
					products[fruit][1]=send("apply_#{offer}", products[fruit][0])
				end				
			end
			products 
	end
end