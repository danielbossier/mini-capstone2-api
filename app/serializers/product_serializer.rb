class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :description, :price, :is_discounted?, :tax, :total, :supplier_id, :quantity
end
