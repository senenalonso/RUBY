class PriceList
	@@price_list = Hash[:apple => 10, :orange => 5, :grape => 15, :banana => 20, :watermelon => 50]	 
	def self.get_price_list
		@@price_list
	end	
end