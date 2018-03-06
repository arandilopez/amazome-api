class CartController < ApplicationController
  before_action :authenticate_user, :set_cart
  before_action :set_product, only: [:create, :destroy]

  def index
    @products = @cart.products

    render json: @products
  end

  def create
    @cart.products << @product
    render json: @cart.products, status: :created
  end

  def destroy
    @cart.products.delete(@product)
  end

  private
  def set_cart
    @cart = current_user.cart
  end

  def set_product
    id = params['id'] || products_params['id']
    @product = Product.find id
  end

  def products_params
    params.require(:product).permit(:id)
  end
end
