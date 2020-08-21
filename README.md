# テーブル設計

## usersテーブル

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false              |
| email            | string | null:false, unique: true |
| password         | string | null: false              |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| family_name_kana | string | null: false              |
| first_name_kana  | string | null: false              |
| birth_year       | date   | null: false              |
| birth_month      | date   | null: false              |
| birth_day        | date   | null: false              |

### Association

- has_many :items
- has_many :comments
- has_one :credit_card
- has_one :delivery_address

## credit_cardsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user_id          | references | null: false, foreign_key, true |

### Association

- belongs_to :user

## delivery_addressテーブル 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false, unique: true      |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association 

- belongs_to :user
- belongs_to :item

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | references | null: false, foreign_key: true |
| item_condition  | references | null: false, foreign_key: true |
| shipping_charge | references | null: false, foreign_key: true |
| prefecture_id   | references | null: false, foreign_key: true |
| preparation_day | references | null: false, foreign_key: true |
| item_image_id   | references | null: false, foreign_key: true |
| user_id         | references | null: false, foreign_key: true |

### Association 

- has_many :comments
- has_many :item_images
- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :item_condition  
- belongs_to_active_hash :shipping_charge 
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :preparation_day

## categoriesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :items

## item_imagesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| url     | string     | null: false                    |

### Association

- belongs_to :item