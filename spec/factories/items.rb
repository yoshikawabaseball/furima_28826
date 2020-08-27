FactoryBot.define do
  factory :item do
    name {'野球ボール'}
    introduction {Faker::Lorem.sentence}
    price { 500 }
    category_id { 2 }
    item_condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 15 }
    preparation_day_id { 2 }  
  end
end
