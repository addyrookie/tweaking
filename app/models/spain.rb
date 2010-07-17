require 'nokogiri'
require 'open-uri'

class Spain < ActiveRecord::Base

#  def self.extract_news
#    url = "http://www.goal.com/en/news/12/spain/archive/1" # change /10 to appropriate value
#    doc = Nokogiri::HTML(open(url))
#    @title =  doc.at_css("title").text
#    doc.css("#news-archive a").each do |item|
#      if item.text == "2" 
#        break 
#      else
#        latest_item = item.text
#        #break if latest_item == Goal.first.news
#        link = item[:href]  
#       Spain.create(:news => "#{item.text}" , :link => link )  
#      end
#    end
#  end
#end

#  def first_50(new_candidate)
#    @first50 = Spain.all(:limit => 50 , :order=> "created_at desc")
#    @first50.each do |f|
#    if f.news == new_candidate.text 
#      return f  
#    else
#      next
#  end   

  def self.pass_filter(test_collection)
    pass_band = []
    test_collection.each do |mite|
       if mite.text == "2"
        return pass_band
      end  
      if mite.text == Spain.last.news 
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
    url = "http://www.goal.com/en/news/12/spain/archive/1"
    doc = Nokogiri::HTML(open(url))
    @title =  doc.at_css("title").text
    @updates =  self.pass_filter(doc.css("#news-archive a"))
    @updates.each do |item|
      link = item[:href]  
      if Spain.create(:news => "#{item.text}" , :link => link )   
        Bin.create(:news => "#{item.text}" , :link => link )
        puts "Created id :#{Goal.id} "
      end  
    end  
  end
  
  
   def self.first_time
     url = "http://www.goal.com/en/news/12/spain/archive/1"
    doc = Nokogiri::HTML(open(url))
    @title =  doc.at_css("title").text
    @init =  self.pass_first(doc.css("#news-archive a"))
    @init.each do |item|
    link = item[:href]  
      if Spain.create(:news => "#{item.text}" , :link => link )  
        Bin.create(:news => "#{item.text}" , :link => link )
      end 
    end
  end  
  
  
  
  define_index do
    indexes news
    has :id , :sortable => true
  end
end
