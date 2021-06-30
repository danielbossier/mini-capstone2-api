class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    if current_user
      order.save
      render json: order.as_json
    else
      render json: { error: order.errors.full_messages }
    end
  end

  def show
    order = current_user.orders.find_by(id: params[:id])
    render json: order
  end

  def index
    if current_user
      orders = current_user.orders
      render json: orders
    else
      render json: [], status: :unauthorized
    end
  end
end
