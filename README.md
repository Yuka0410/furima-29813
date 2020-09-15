# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false | 
| birthday | string | null: false |

###Association
- has_many :items, purchases
- has_one :address



## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false |
|user-id | string | null: false |
| price  | string | null: false |
| name   | string | null: false |

###Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type   | Options     |
| --------| ------ | ----------- |
| item-id | string | null: false | 
| user-id | string | null: false |

###Association
- belongs_to :user, item
- has_one :address

## address テーブル

| Column  | Type   | Options     |
| --------| ------ | ----------- |
| address | string | null: false |
| item-id | string | null: false | 
| user-id | string | null: false |

###Association
- belongs_to :user
- belongs_to :purchase



