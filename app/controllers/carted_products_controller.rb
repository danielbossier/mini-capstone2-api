class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.new(
      quantity: params["quantity"],
      product_id: params["product_id"],
      user_id: current_user.id,
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: { error: carted_product.errors.full_messages },
             status: :unprocessable_entity
    end
  end
end
