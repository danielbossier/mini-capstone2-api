class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.new(
      quantity: params["quantity"],
      product_id: params["product_id"],
      user_id: current_user.id,
      status: "carted",
    )
    if carted_product.save
      render json: carted_product
    else
      render json: { error: carted_product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    carted_products = current_user.carted_products
    render json: carted_products
  end
end
