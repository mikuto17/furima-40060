class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @boughts_shipping = Boughtsshipping.new
  end

  

  def create
  @product = Product.find(params[:product_id])
  @bought_shipping = Boughtsshipping.new(bought_params)
    if @bought_shipping.valid?
      @bought_shipping.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bought_params
    params.require(:boughtsshipping).permit(:product_id, :postal, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id)
  end

end
