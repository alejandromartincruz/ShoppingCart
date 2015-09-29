require 'pry' 

class ShoppingCart
  attr_reader :items, :items_name
  def initialize
    @items = []
    @items_name = []
  end

  def add_item(item)
    @items.push(item)
    @items_name.push(item.name)
  end

  def show_items
    puts "The items added in your cart are:"
    puts items_name
  end

  def checkout
    @total_price = 0
    #Add each item price to our total
    @items.each do |item|
    @total_price += item.price
    end
    #return  our total price to whoever called for it
    @total_price
  end

end

class Item 
  attr_reader :name, :price
  def initialize(name, price)
      @name = name
      @price = price
  end

  def price
      @price
  end
end

class Houseware < Item
  def price
      if @price >= 100
        @price = @price * 0.95
        puts "new price: #{@price}"
        puts "Houseware discount applied"
      else
        puts "price not enough for discount on houseware items"
        @price
      end
  end
end

class Fruit < Item
  def price
      weekend = weekend_checker
      if weekend == true
        @price = @price * 0.9
        puts "new price: #{@price}"
        puts "Fruit discount applied"
      else
        puts "discount not available today for fruit"
        @price
      end
  end
end


#Check if today is weekend with this method

def weekend_checker
  time = Time.now
  puts time
  weekend = false

  if time.sunday? == false
    weekend = time.saturday?
  end

  if time.saturday? == false
    weekend = time.sunday?
  end
  
  weekend
  #binding.pry
end


Shopping_Cart = ShoppingCart.new

banana = Fruit.new("Banana", 10)
orange_juice = Item.new("Orange juice", 10)
Rice = Item.new("Rice", 1)
vacuum_cleaner = Houseware.new("Vacuum cleaner", 150)
anchovies = Item.new("Anchovies", 2)

Shopping_Cart.add_item(banana)
Shopping_Cart.add_item(orange_juice)
Shopping_Cart.add_item(Rice)
Shopping_Cart.add_item(vacuum_cleaner)
Shopping_Cart.add_item(anchovies)

#Shopping_Cart.show_items

#puts banana.price
#puts vacuum_cleaner.price

joshs_cart = ShoppingCart.new
joshs_cart.add_item(orange_juice)
joshs_cart.add_item(Rice)
joshs_cart.show_items
puts ("Your total today is $#{joshs_cart.checkout}. Have a nice day!")