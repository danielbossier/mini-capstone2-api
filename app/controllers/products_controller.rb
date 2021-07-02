class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    if params[:category]
      category = Category.find_by(name: params[:category])
      products = category.products
    else
      products = Product.all
    end
    render json: products
  end

  def show
    products = Product.find(params[:id])
    render json: products
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
      quantity: params["quantity"],
      supplier_id: params["supplier_id"],
    )
    if product.save
      render json: product.as_json
    else
      render json: { error: product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    product_id = params["id"]
    product = Product.find(product_id)
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description
    product.quantity = params["quantity"] || product.quantity
    product.supplier_id = params["supplier_id"] || product.supplier_id

    if product.save
      render json: product.as_json
    else
      render json: { error: product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: { message: "You have destroyed that product." }
  end
end
