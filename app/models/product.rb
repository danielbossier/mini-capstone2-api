class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true

  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :products, through: :category_products

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
