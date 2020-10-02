require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入しトークン、住所保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      #expect(@order).to be_valid
    end
    it 'tokenが空では登録できないこと' do
     # @order.token = nil
     #@order.valid?
     #expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    end
    it 'area_idを洗濯していないと保存できないこと' do
    end
    it 'cityが空だと保存できないこと' do
    end
    it 'blockが空だと保存できないこと' do
    end
    it 'building_nameは空でも保存できること' do
    end
    it 'phone_numberが空だと保存できないこと' do
    end
    it 'phone_numberが半角数字のハイフンを含まない形式でないと保存できないこと' do
    end
  end
end
