require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.goal.com/en/news/10/italy/archive/1"
doc = Nokogiri::HTML(open(url))
  puts doc.at_css("title").text
  doc.css("#news-archive a").each do |item|
  if item.text == "2"
    break 
  else
   puts item.text
  end
end
  
 
  
