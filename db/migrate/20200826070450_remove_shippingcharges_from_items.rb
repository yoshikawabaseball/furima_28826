class RemoveShippingchargesFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :shipping_charge, :integer
  end
end
