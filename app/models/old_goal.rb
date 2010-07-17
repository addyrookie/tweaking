require 'nokogiri'
require 'open-uri'

class Goal < ActiveRecord::Base

  def self.extract_news
    url = "http://www.goal.com/en/news/10/italy/archive/1"
    doc = Nokogiri::HTML(open(url))
    @title =  doc.at_css("title").text
    doc.css("#news-archive a").each do |item|
      latest_item = item.text
      if item.text == "2" 
        break 
      elsif latest_item == Goal.first.news
        break
      else  
        link = item[:href]  
        if Goal.create(:news => "#{item.text}" , :link => link )  
          Bin.create(:news => "#{item.text}" , :link => link )
        end  
      end
    end
  end
end


#    url = "http://www.goal.com/en/news/10/italy/archive/1"
#     doc.css("#news-archive li").each do |item|
# puts item.text
   #   puts item.text[/[0-9]+:[0-9]+/]   it works gives the time hh:mm format
