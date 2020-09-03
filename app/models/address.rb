class Address < ApplicationRecord
  belongs_to :user_item
  belongs_to :user
end
