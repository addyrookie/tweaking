require 'scrapi'
class Product < ActiveRecord::Base

  attr_accessible :name , :price 
 # acts_as_fleximage :image_directory => "public/images/uploaded_photos"



  def Product.fetch_prices
    scraper = Scraper.define  do 
    #  process 'div.firstRow div.priceAvail>div>div.PriceCompare>div.BodyS'  , :price => :text
      process '.firstRow .PriceXLBold' , :price => :text
      result  :price 
    end
    
    find_all_by_price(0.0).each do  |product|
       uri = URI.parse('http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=product.name&Find.x=0&Find.y=0&Find=Find')
       product.update_attribute :price ,  scraper.scrape(uri)[/[.0-9]+/]
    
    end
 
  end
end
