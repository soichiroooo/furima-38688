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
has_many :transactions

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| explanation     | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| shipping_charge | integer    | null: false                    |
| prefecture      | integer    | null: false                    |
| shipping_date   | integer    | null: false                    |
| user            | reference  | null: false, foreign_key: true |

belongs_to :user
has_one :transaction

## transactions テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | reference  | null: false, foreign_key: true |
| item            | reference  | null: false, foreign_key: true |

belongs_to :item
belongs_to :user
has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| address_line    | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| transaction     | reference  | null: false, foreign_key: true |

belongs_to :transaction