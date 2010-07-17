class ProductsController < ApplicationController

  make_resourceful do
  actions :index , :show , :new , :update , :destroy , :edit
  end
  
  
  def create
     @product = Product.new(params[:product])
    if @product.save
      redirect_to product_url(@product)
    else
      flash[:notice] = 'Your product did not pass validation!'
      render :action => 'new'
    end
  end

end
