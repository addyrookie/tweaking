class SpainsController < ApplicationController
  def index
    if params[:search] 
      @latest_news= Spain.search params[:search] , :page => params[:page] , :per_page => 10 , :order => "id desc"
    else 
      @latest_news = Spain.paginate(:page => params[:page] , :per_page => 20 , :order => "id desc")
    end
  end  

end
