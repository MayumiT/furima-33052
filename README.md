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
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name     　　　| string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | foreign_key: true              |

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :area
- belongs_to_active_hash :day

## orders テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses　テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| post_code          | string     | null: false       |
| area_id            | integer    | null: false       |
| city               | string     | null: false       |
| house_number       | string     | null: false       |
| building_name      | string     |                   |
| phone_number       | string     | null: false       |
| order              | references | foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :area
