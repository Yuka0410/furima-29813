# テーブル設計

## users テーブル

| Column           | Type    | Options         |
| -----------      | ------  | --------------- |
| nickname         | string  | null: false     |
| family_name      | string  | null: false     |
| first-name       | string  | null: false     |
| family_name_kana | string  | null: false     |
| first_name_kana  | string  | null: false     |
| email            | string  | null: false     |
| password         | string  | null: false     | 
| birthday         | date    | null: false     |

###Association
- has_many :items
- has_one :address



## items テーブル

| Column  | Type       | Options           |
| ------  | ------     | ----------------- |
| name    | string     | null: false       |
| text    | text       | null: false       |
| price   | integer    | null: false       |
| user    | references | foreign_key: true |


###Association
- belongs_to :user


## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| address | references | foreign_key: true | 

###Association
- has_one :address

## address テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| prefecture    | string     | null: false       |
| municipality  | string     | null: false       |
| block         | string     | null: false       |
| building_name | string     | null: false       |
| phone_number  | integer    | null: false       |
| item          | references | foreign_key: true | 
| user          | references | foreign_key: true |

###Association
- belongs_to :user
- belongs_to :purchase



