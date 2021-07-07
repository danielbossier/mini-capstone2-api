class CartedProductsController < ApplicationController
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
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: { message: "carted Product successfully removed." }
  end
end
