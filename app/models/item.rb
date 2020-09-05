class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :user_items
  has_one :address

  has_one_attached       :image
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  validates :name, :introduction, :price, :image, :category_id, :item_condition_id, :shipping_charge_id,
            :prefecture_id, :preparation_day_id, presence: true

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  validates :price, numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300, message: 'Out of setting range' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
