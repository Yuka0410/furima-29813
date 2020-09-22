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

                        
   validates :name, :text, :category, presence: true
   validates :category_id, numericality: { other_than: 1 }
   validates :name, :text, :condition, presence: true
   validates :conditon_id, numericality: { other_than: 1 }
   validates :name, :text, :payer, presence: true
   validates :payer_id, numericality: { other_than: 1 }
   validates :name, :text, :area, presence: true
   validates :area_id, numericality: { other_than: 0 }
   validates :name, :text, :delivery_date, presence: true
   validates :delivery_date_id, numericality: { other_than: 1 }
end
