class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: product.price * params[:quantity],
      tax: product.tax * params[:quantity],
      total: product.total * params[:quantity],
    )
    if order.save
      render json: order.as_json
    else
      render json: { error: order.errors.full_messages }
    end
  end

  def show
    if current_user
      order = Order.find(params[:id])
      render json: order
    end
  end

  def index
    order = Order.all
    render json: order
  end
end
