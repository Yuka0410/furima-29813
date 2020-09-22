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

   #ActiveHushのバリデーション                   
   validates :name, :text, :category, presence: true
   validates :category_id, numericality: { other_than: 1 }
   validates :name, :text, :condition, presence: true
   validates :condition_id, numericality: { other_than: 1 }
   validates :name, :text, :payer, presence: true
   validates :payer_id, numericality: { other_than: 1 }
   validates :name, :text, :area, presence: true
   validates :area_id, numericality: { other_than: 0 }
   validates :name, :text, :delivery_date, presence: true
   validates :delivery_date_id, numericality: { other_than: 1 }
   #普通のバリデーション 
   validates :image, presence: true
   validates :name, presence: true
   validates :text, presence: true
   validates :price, presence: true
   validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width characters."}
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end
