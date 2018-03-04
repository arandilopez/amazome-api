class WishListProductsController < ApplicationController
  before_action :authenticate_user, :set_wish_list
  before_action :set_product, only: [:create, :destroy]
  def index
    @products = @wish_list.products

    render json: @products
  end

  def create
    @wish_list.products << @product

    render json: @product, status: :created, location: @product
  end

  def destroy
    @wish_list.products.delete(@product)
  end

  private
  def set_wish_list
    @wish_list = current_user.wish_lists.find(params['wish_list_id'])
  end

  def set_product
    id = params['id'] || product_params['id']
    @product = Product.find id
  end

  def product_params
    params.require(:product).permit(:id)
  end
end
