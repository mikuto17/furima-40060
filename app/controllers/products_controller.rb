class ProductsController < ApplicationController
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :category_id, :condition_id, :description, :price, :prefecture_id, :days_until_id, :burden_id)
  end

end
