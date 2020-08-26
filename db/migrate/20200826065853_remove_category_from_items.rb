class RemoveCategoryFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :category, :integer
  end
end
