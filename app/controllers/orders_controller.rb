class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    order = Order.new(
      user_id: current_user.id,
    )
    if order.save
      carted_products.update_all(status: "purchased", order_id: order.id)
      order.money_math
      render json: order
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
