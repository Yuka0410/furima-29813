class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :payer
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :area_id, numericality: { other_than: 0, message: 'Select' }
    validates :price
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :condition_id
      validates :payer_id
      validates :delivery_date_id
    end
  end

  validates :price, numericality: { message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
