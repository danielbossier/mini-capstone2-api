class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    if order.save
      carted_products.update_all(status: "purchased", order_id: order.id)
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
    orders = current_user.orders
    render json: orders
  end
end
