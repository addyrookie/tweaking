class GoalsController < ApplicationController
 # make_resourceful do
 # actions :all
 # end

  def index 
    #@latest_news =Goal.paginate(:page => params[:page] , :per_page => 20 , :order => "id desc ") 
   # @latest_news = @latest.reverse
   @latest_news= Goal.search(params[:search])
  
  end
end
