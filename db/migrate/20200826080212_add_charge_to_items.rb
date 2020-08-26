class AddChargeToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shipping_charge_id, :integer
  end
end
