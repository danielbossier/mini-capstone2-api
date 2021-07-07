class OrderSerializer < ActiveModel::Serializer
  attributes :id, :subtotal, :tax, :total, :money_math

  has_many :carted_products
end
