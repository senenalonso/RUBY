require_relative 'OffersApplicator'
require_relative 'PriceList'

class ShoppingCart
  attr_accessor :products
  def initialize
      @price_list = PriceList.get_price_list
      @products = {}  
  end

  
  def add_product_to_cart(product)
    init = [1,0]
    @products.key?(product) ? @products[product][0] = @products[product][0] += 1 : @products[product] = init
  end

  
  def calculate_cost
    @products.each do |product, details|
      @products[product][1] = @price_list[product]*@products[product][0]
    end
  end

  
  def cost
    price = 0
    @products.each do |product, details|
      price += details[1]
    end
    puts "The totals cost is: #{price}"
  end

  def show
    @products.each do |product, details|
      puts "#{details[0]} #{product.to_s}: #{details[1]}$"
    end    
  end

  def finish
    show
    cost
  end

end



cart = ShoppingCart.new

cart.add_product_to_cart :apple
cart.add_product_to_cart :apple
cart.add_product_to_cart :banana
cart.add_product_to_cart :banana
cart.add_product_to_cart :orange
cart.add_product_to_cart :orange
cart.add_product_to_cart :orange
cart.add_product_to_cart :orange

cart.calculate_cost
cart.finish

offers = OffersApplicator.new
offers.add_offer(:apple, "apples_2x1")
offers.add_offer(:orange, "oranges_3x2")
offers.add_offer(:grape, "banana_free_for_4_grapes")

cart.products = offers.apply_offers(cart.products)

cart.finish