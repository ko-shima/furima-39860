# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| image              | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category           | string     | null: false                    |
| condition          | text       | null: false                    |
| postage            | string     | null: false                    |
| region             | string     | null: false                    |
| shipping_data      | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## Orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shippings

## Shippings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building           | text       |                                |
| phone_number       | integer    | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order