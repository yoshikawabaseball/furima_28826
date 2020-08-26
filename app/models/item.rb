class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  #has_many :comments
  #has_many :user_items
  #has_many :user, through: :user_items
  has_one_attached       :image
  belongs_to_active_hash :category_id
  belongs_to_active_hash :item_condition_id
  belongs_to_active_hash :shipping_charge_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :preparation_day_id
  
  validates :name, :introduction, :price, :category_id, :item_condition_id, :shipping_charge_id,
            :prefecture_id, :preparation_day_id, presence: true


  validates :category_id, :item_condition_id, :shipping_charge_id, 
            :prefecture_id, :preparation_day_id, numericality: { other_than: 1 }
end
