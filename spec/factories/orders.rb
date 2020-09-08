FactoryBot.define do
  factory :order do
    token { 'hogehoge' }
    post_code { '123-4567' }
    prefecture_id { 3 }
    city { '横浜市' }
    house_number { '青山1-1-1' }
    building_name { '柳ビル' }
    phone_number { '09011112222' }
  end
end
