class Item < ApplicationRecord
  has_many :comments
  has_many :item_images
  has_many :user_items
  has_many :user, through: :user_items
  has_one_atatached :image
  #belongs_to_active_hash :category
  #belongs_to_active_hash :item_condition  
  #belongs_to_active_hash :shipping_charge 
  #belongs_to_active_hash :prefecture
  #belongs_to_active_hash :preparation_day
end
