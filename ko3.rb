require 'rubygems'

 Product.find_all_by_price(50.98).each do  |product|
 puts product.name
 
 end
