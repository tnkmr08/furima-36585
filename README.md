# テーブル設計

## users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               | 



### Association

- has_many :items
- has_many :orders


## items テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| category           | string     | null: false                    | 
| condition          | string     | null: false                    |
| delivery_fee       | string     | null: false                    |
| area               | string     | null: false                    |
| days               | string     | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| ship_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :ship


## ships テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| prefectures        | text       | null: false                    |
| city               | string     | null: false                    | 
| block              | string     | null: false                    |
| building           | string     |                                |
| telephone_number   | string     | null: false                    |

### Association

- has_many :orders