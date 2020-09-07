FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials }
    email                  { 'kkk@email.com' }
    password               { '1a1a1a' }
    password_confirmation  { password }
    family_name            { '田中' }
    first_name             { '直樹' }
    family_name_kana       { 'タナカ' }
    first_name_kana        { 'ナオキ' }
    birth_day              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
