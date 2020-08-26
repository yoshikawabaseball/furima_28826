class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  #has_many :comments
  #has_many :item_images
  #has_many :user_items
  #has_many :user, through: :user_items
  #has_one_atatached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition_id
  belongs_to_active_hash :shipping_charge_id
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
  validates :name, :introduction, :price, :category_id, :item_condition_id, :shipping_charge_id,
            :prefecture_id, :preparation_day_id, presence: true


  validates :category_id, :item_condition_id, :shipping_charge_id, 
            :prefecture_id, :preparation_day_id, numericality: { other_than: 1 }
end
