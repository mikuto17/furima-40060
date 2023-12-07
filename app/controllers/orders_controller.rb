class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  

  def create
  @bought_shipping = BoughtShipping.new(bought_params)
    if @bought_shipping.valid?
      @bought_shipping.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bought_params
    params.require(:bought_shipping).permit(:user_is, :product_id, :postal, :prefecture_id, :city, :street_address, :building_name, :phone_number, :bought_id)
  end

end
