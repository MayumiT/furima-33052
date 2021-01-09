# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth              | date   | null: false |


### Association

- has_many :items
- has_many :buys

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| image_id      | integer    | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| date_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | foreign_key: true              |

### Association

- belongs_to :user
- has_one :buy
- has_one_active_hash :category
- has_one_active_hash :condition
- has_one_active_hash :prefecture
- has_one_active_hash :area
- has_one_active_hash :date

## buys テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user_id            | references | foreign_key: true |
| item_id            | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses　テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| post_code          | strings    | null: false       |
| prefecture_id      | integer    | null: false       |
| city               | strings    | null: false       |
| house_number       | strings    | null: false       |
| building_name      | strings    | null: false       |
| phone_number       | strings    | null: false       |
| item_id            | references | foreign_key: true |
| user_id            | references | foreign_key: true |

### Association

- belongs_to :buy
- has_one_active_hash :prefecture
