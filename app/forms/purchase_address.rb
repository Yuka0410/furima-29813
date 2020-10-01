class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :city, :block, :building_name, :phone_number, :price, :area_id, :user_id, :item_id
  attr_accessor :token 

  #  with_options presence: true do
  #     validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #     validates :phone_number, format: {with: /^[0-9]+$/, message: "is invalid. Input Include half-width numbers"}
  #     #購入ページでは値段は表示だけであり保存する必要があるのか。tokunに送信するだけならば不要ではないのか？
  #     #itemモデルからpriceとarea-idのバリデーションコピーしてきた。不要なら消す。itemモデルのバリデーションは出品の時に使うから置いておくべきと考えるが、
  #     #addressはpurchaseから紐づいている（のか？）ためaddressモデルにバリデーションは不要か
  #     validates :price, numericality: { message: 'Half-width number' }
  #     validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  #     validates :area_id, numericality: { other_than: 0, message: 'Select' }
  #     with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."} do
  #       validates :city
  #       validates :block
  #     end
  #  end
  
#area_idはitemモデルにあるから不要か  
#building_nameは任意のため正規表現だけつける
   validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
   validates :token, presence: true 
   def save

     purchase = Purchase.create(user_id: user_id, item_id: item_id)
     #purchaseという変数にpurchase.createで保存
  
     Address.create(postal_code: postal_code, area_id: area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
     #purchase保存してからaddressを保存する順番でないとaddressは保存できない
    end
    

end

#itemモデルにあるarea_idを引き出すが、実際に保存するのはaddressのモデル。