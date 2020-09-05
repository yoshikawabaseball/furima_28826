class Order

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :prefecture_id
    validates :city
    validates :house_number
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}
 
  def save
    binding.pry
    UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end

