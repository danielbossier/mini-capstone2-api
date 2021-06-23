class ChangeActiveToQuantity < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :active, :quantity
  end
end
