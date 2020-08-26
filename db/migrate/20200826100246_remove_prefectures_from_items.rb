class RemovePrefecturesFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :prefecture, :integer
  end
end
