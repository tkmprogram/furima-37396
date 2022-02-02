# テーブル設計

## users テーブル

| Column                | Type    | Options                  |
| --------------------- | ------- | ------------------------ |
| nickname              | string  | null: false              |
| email                 | string  | null: false, unique: true|
| encrypted_password    | string  | null: false              |
| last_name             | string  | null: false              |
| first_name            | string  | null: false              |
| last_name_katakana    | string  | null: false              |
| first_name_katakana   | string  | null: false              |
| birthday              | date    | null: false              |

- has_many :products
- has_many :purchases

## Products テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| category_id         | integer   | null: false                    |
| situation_id        | integer   | null: false                    |
| shipping_charge_id  | integer   | null: false                    |
| prefecture_id       | integer   | null: false                    |
| send_day_id         | integer   | null: false                    |
| price               | integer   | null: false                    |
| title               | string    | null: false                    |
| explanation         | text      | null: false                    |
| user                | reference | null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase

## Purchases テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| product | reference | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :product
- has_one :send

## Sends テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | -----------                    |
| post_code      | string    | null: false                    |
| prefecture_id  | integer   | null: false                    |
| municipalities | string    | null: false                    |
| address        | string    | null: false                    |
| building       | string    |                                |
| tel            | string    | null: false                    |
| purchase       | reference | null: false, foreign_key: true |

- belongs_to :purchase