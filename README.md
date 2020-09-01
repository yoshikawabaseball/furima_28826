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
| birth_day        | date   | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :user_items
- has_many :items, through: :user_items
- has_one :delivery_address


## addressテーブル 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false, unique: true      |
| user_item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user_item
- belongs_to :user


## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association 

- belongs_to :user
- belongs_to :item


## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false, foreign_key: true |
| item_condition  | integer    | null: false, foreign_key: true |
| shipping_charge | integer    | null: false, foreign_key: true |
| prefecture      | integer    | null: false, foreign_key: true |
| preparation_day | integer    | null: false, foreign_key: true |
| item_image      | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association 

- has_many :comments
- has_many :user_items
- has_many :user, through: :user_items
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition  
- belongs_to_active_hash :shipping_charge 
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :preparation_day


## user_itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :delivery_address
- belongs_to :user
- belongs_to :item


## brandsテーブル

| Column | Type   | Options |
| ------ | ------ | ------- |
| name   | string |         |

### Association

- has_many :items