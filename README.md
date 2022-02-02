# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| Nickname              | string | null: false |
| Email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| Last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_katakana    | string | null: false |
| first_name_katakana   | string | null: false |
| birthday              |

- has_many :products
- has_many :purchases

## Products テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| category         | string    | null: false                    |
| situation        | text      | null: false                    |
| shipping_charges | string    | null: false                    |
| area             | string    | null: false                    |
| send_day         | string    | null: false                    |
| price            | string    | null: false                    |
| title            | string    | null: false                    |
| explanation      | text      | null: false                    |
| image            | text      | null: false                    |
| user             | reference | null: false, foreign_key: true |

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

## Send テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| post_code      | string | null: false |
| prefecture     | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building       | string |             |
| tel            | string | null: false |

- belongs_to :purchase