class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,            null: false
      t.text       :introduction,    null: false
      t.integer    :price,           null: false
      t.integer    :category,        null: false, foreign_key: true
      t.integer    :item_condition,  null: false, foreign_key: true
      t.integer    :shipping_charge, null: false, foreign_key: true
      t.integer    :prefecture,      null: false, foreign_key: true
      t.integer    :preparation_day, null: false, foreign_key: true
      #t.references :item_image,      null: false, foreign_key: true
      #t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
