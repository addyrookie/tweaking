desc "Fetch product prices from web"
task :fetch_prices => :environment do

  require 'nokogiri'
  require 'open-uri'

  Product.find_all_by_price(50.98).each do  |product|
    url = "http://www.walmart.com/search/search-ng.do?search_constraint=4096&ic=48_0&search_query=#{CGI.escape(product.name)}&Find.x=0&Find.y=0&Find=Find"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css(".PriceCompare .BodyS, .PriceMBold").text[/[0-9\.]+/]
    product.update_attribute(:price, price) 
#     puts product.name    
  end
end
