require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入しトークン、住所保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'tokenが空では登録できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '12-34567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
    end
    it 'area_idを選択していないと保存できないこと' do
      @purchase_address.area_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Area Select')
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @purchase_address.block = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input Include half-width numbers", "Phone number can't be blank")
    end
    it 'phone_numberが半角数字のハイフンを含まない形式でないと保存できないこと' do
      @purchase_address.phone_number = '０９０−１２３４−５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input Include half-width numbers", "Phone number is too long (maximum is 11 characters)")
    end
  end
end
