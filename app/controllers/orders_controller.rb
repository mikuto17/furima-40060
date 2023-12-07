class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @boughts_shipping = BoughtsShipping.new
  end

  

  def create
  @product = Product.find(params[:product_id])
  @boughts_shipping = BoughtsShipping.new(bought_params)
    if @boughts_shipping.valid?
      @boughts_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def bought_params
    params.require(:boughts_shipping).permit(:product_id, :postal, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id)
  end

end
