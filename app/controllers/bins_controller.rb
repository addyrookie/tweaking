
class BinsController < ApplicationController
  
  
  def index
    @latest_news =Bin.paginate(:page => params[:page] , :per_page => 20 , :order => "id desc")   
  end

end
