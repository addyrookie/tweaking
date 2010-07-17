require 'rubygems'
require 'scrapi'

scraper = Scraper.define  do 
  array  :items
  process "div.item" , :items => Scraper.define {
    process 'a.prodLink'  , :title => :text , :link => "@href"
    process 'div.priceAvail>div>div.PriceCompare>div.BodyS'  , :price => :text
    result  :title ,  :price , :link
  } 
  result :items
end

uri = URI.parse('http://www.walmart.com/search/search-ng.do?search_constraint=4096&ic=48_0&search_query=house+md+season+3&Find.x=0&Find.y=0&Find=Find')
  scraper.scrape(uri).each do |product|
    puts product.title
    puts product.price
    puts product.link
    puts
  end
