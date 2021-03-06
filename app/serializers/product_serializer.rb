class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :description, :price, :is_discounted?, :tax, :total, :supplier, :quantity

  belongs_to :supplier
end
