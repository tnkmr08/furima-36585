# テーブル設計

## users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               | 
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

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | integer    | null: false                    |
| category_id        | integer    | null: false                    | 
| condition_id       | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :ship


## ships テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefectures        | text       | null: false                    |
| city               | string     | null: false                    | 
| block              | string     | null: false                    |
| building           | string     |                                |
| telephone_number   | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order