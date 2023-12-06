class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user 
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless current_user == @product.user
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @product.user
    @product.destroy
    redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :category_id, :condition_id, :description, :price, :prefecture_id, :days_until_id, :burden_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
