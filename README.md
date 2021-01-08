# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | date   | null: false |
| birth_month        | date   | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| item_name  | string     | null: false                    |
| text       | text       | null: false                    |
| category   | string     | null: false                    |
| condition  | string     | null: false                    |
| delivery   | string     | null: false                    |
| area       | string     | null: false                    |
| date       | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | foreign_key: true              |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| item_id            | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item