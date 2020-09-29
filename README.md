# テーブル設計

## users テーブル

| Column           | Type    | Options         |
| -----------      | ------  | --------------- |
| nickname         | string  | null: false     |
| family_name      | string  | null: false     |
| first_name       | string  | null: false     |
| family_name_kana | string  | null: false     |
| first_name_kana  | string  | null: false     |
| email            | string  | null: false     |
| password         | string  | null: false     | 
| birthday         | date    | null: false     |

###Association
- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| payer_id         | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| delivery_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

###Association
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true | 
| item    | references | null: false, foreign_key: true |

###Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true | 


###Association
- belongs_to :purchase



