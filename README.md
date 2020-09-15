# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false | 
| birthday | string | null: false |

###Association
- has_many :items, purchases



## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false |
| image  | string | null: false |
|user-id | string | null: false |
| price  | string | null: false |
|comments| string | null: false |#見本ではカラムは不必要？

###Association
- belongs_to :user
- has_many :comments
- has_one :purchase

## purchases テーブル？？？これは中間テーブルにすべきか？

| Column  | Type   | Options     |
| --------| ------ | ----------- |
| address | string | null: false | #受け取り先のaddress
| card    | string | null: false |
| user-id | string | null: false | #配送者のprefecture?addressにまとめるか？

###Association
- belongs_to :user, item

