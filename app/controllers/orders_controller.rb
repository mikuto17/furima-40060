class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @product = Product.find(params[:product_id])
    @boughts_shipping = BoughtsShipping.new
  end

  

  def create
  @product = Product.find(params[:product_id])
  @boughts_shipping = BoughtsShipping.new(bought_params)
    if @boughts_shipping.valid?
      pay_item
      @boughts_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def bought_params
    params.require(:boughts_shipping).permit(:product_id, :postal, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @product.price,  
        card: @boughts_shipping.token,    
        currency: 'jpy'                 
      )
  end
end
