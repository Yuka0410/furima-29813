require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報入力' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空だと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空だと保存できないこと' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'category_idを選択していないと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'condition_idを選択していないと保存できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it 'payer_idを選択していないと保存できないこと' do
      @item.payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Payer Select')
    end

    it 'area_idを選択していないと保存できないこと' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Area Select')
    end

    it 'delivery_date_idを選択していないと保存できないこと' do
      @item.delivery_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery date Select')
    end

    it 'priceが空だと保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは半角数字でないと保存できないこと' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceは300円以下の値段は保存できないこと' do
      @item.price = '10'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceは9999999円以上の値段は保存できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'userが結びついていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
