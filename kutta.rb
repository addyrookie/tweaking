require 'rubygems'
require 'scrapi'

scraper = Scraper.define  do 
  process 'title'  , :page_name => :text
  result  :page_name 
end

uri = URI.parse('http://www.walmart.com/search/search-ng.do?search_constraint=4096&ic=48_0&search_query=house+md+season+3&Find.x=0&Find.y=0&Find=Find')
p scraper.scrape(uri)
