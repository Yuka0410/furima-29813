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
- has_many :purchase


## items テーブル

| Column       | Type       | Options           |
| ------------ | ------     | ----------------- |
| name         | string     | null: false       |
| text         | text       | null: false       |
| category     | integer    | null: false       |
| condition    | integer    | null: false       |
| delivery_fee | integer    | null: false       |
| area         | integer    | null: false       |
| days         | integer    | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

###Association
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true | 
| item    | references | foreign_key: true |

###Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| prefecture    | string     | null: false       |
| municipality  | string     | null: false       |
| block         | string     | null: false       |
| building_name | string     |                   |
| phone_number  | integer    | null: false       |
| purchase      | references | foreign_key: true | 


###Association
- belongs_to :purchase



