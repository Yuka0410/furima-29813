class Item < ApplicationRecord
   belongs_to :user
   has_one_attached :image
   #has_one :purchase
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :category
   belongs_to_active_hash :condition
   belongs_to_active_hash :payer
   belongs_to_active_hash :area
   belongs_to_active_hash :delivery_date

   validates :image, presence: true
   validates :name, presence: true
   validates :text, presence: true
   validates :category_id, presence: true 
   validates :category_id, numericality: { other_than: 1 ,message: "Select"}
   validates :condition, presence: true
   validates :condition_id, numericality: { other_than: 1 ,message: "Select"}
   validates :payer, presence: true
   validates :payer_id, numericality: { other_than: 1 ,message: "Select"}
   validates :area, presence: true
   validates :area_id, numericality: { other_than: 0 ,message: "Select"}
   validates :delivery_date, presence: true
   validates :delivery_date_id, numericality: { other_than: 1 ,message: "Select"}
   validates :price, presence: true
   # validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width characters."} itemモデルはintegerなので半角数字以外は0に変換する仕様になってるのでメッセージだけで良い
   validates :price, numericality: { message: 'Half-width number' }
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end
