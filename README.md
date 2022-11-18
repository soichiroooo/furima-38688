# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| date_of_birth      | date     | null: false               |

has_many :items
has_many :purchases

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| price              | integer     | null: false                    |
| explanation        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| shipping_charge_id | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| shipping_date_id   | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

belongs_to :user
has_one :purchase

## purchases テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

belongs_to :item
belongs_to :user
has_one :address

## addresses テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | string      | null: false                    |
| prefecture_id   | integer     | null: false                    |
| city            | string      | null: false                    |
| address_line    | string      | null: false                    |
| building        | string      |                                |
| phone_number    | string      | null: false                    |
| purchase        | references  | null: false, foreign_key: true |

belongs_to :purchase