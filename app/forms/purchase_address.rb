class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :block, :building_name, :phone_number, :price, :area_id, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do # 購入ページでは値段は表示だけでありvalidation不要。area_idはaddressモデルに別途保存するので必要。
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'is invalid. Input Include half-width numbers' }
    validates :phone_number, length: { maximum: 11 }
    validates :area_id, numericality: { other_than: 0, message: 'Select' }
    validates :token
    validates :city
    validates :block
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # purchaseという変数にpurchase.createで保存

    Address.create(postal_code: postal_code, area_id: area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    # purchase保存してからaddressを保存する順番でないとaddressは保存できない
  end
end

# itemモデルにあるarea_idを引き出すが、実際に保存するのはaddressのモデル。
