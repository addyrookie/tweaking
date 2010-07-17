require 'nokogiri'
require 'open-uri'

class Goal < ActiveRecord::Base



  def self.pass_filter(test_collection)
    pass_band = []
    test_collection.each do |mite|
      if mite.text == "2"
        return pass_band
      end  
      if mite.text ==  Goal.last.news
        return pass_band
      else 
        pass_band << mite
      end
    end  
  end
  
  
  def self.pass_first(test_collection)
    pass_band = []
    test_collection.each do |mite|
      if mite.text == "2"
        return pass_band.reverse
      end  
        pass_band << mite
    end  
  end
  
  
   def self.extract_news
    url = "http://www.goal.com/en/news/10/italy/archive/1"
    doc = Nokogiri::HTML(open(url))
    @title =  doc.at_css("title").text
    @updates =  self.pass_filter(doc.css("#news-archive a"))
    @updates.each do |item|
      link = item[:href]  
      if Goal.create(:news => "#{item.text}" , :link => link )   
        Bin.create(:news => "#{item.text}" , :link => link )
        puts "Ceated id :#{Goal.id}"
      end  
    end  
  end
  
  
  def self.first_time
     url = "http://www.goal.com/en/news/10/italy/archive/1"
    doc = Nokogiri::HTML(open(url))
    @title =  doc.at_css("title").text
    @init =  self.pass_first(doc.css("#news-archive a"))
    @init.each do |item|
    link = item[:href]  
      if Goal.create(:news => "#{item.text}" , :link => link )  
        Bin.create(:news => "#{item.text}" , :link => link )
      end 
    end
  end  
    
        
  
end
  
  
  
