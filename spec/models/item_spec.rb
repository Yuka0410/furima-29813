require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報入力' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      #expect(@item).to be_valid
    end

    it 'imageが空だと保存できないこと' do
    end

    it 'nameが空だと保存できないこと' do
      #item.name = ''
      #@item.valid?
      #expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'textが空だと保存できないこと' do
    end
    
    it 'category_idが空だと保存できないこと' do
    end
    
    it 'condition_idが空だと保存できないこと' do
    end
    
    it 'payer_idが空と保存できないこと' do
    end
    
    it 'area_idが空だと保存できないこと' do
    end
    
    it 'delivery_date_idが空だと保存できないこと' do
    end
    
    it 'priceが空だと保存できないこと' do
    end
    
    it 'priceは半角数字でないと保存できないこと' do
     # @user.password = 'aaaaaa'
      #@user.password_confirmation = 'aaaaaa'
      #@user.valid?
      #expect(@user.errors.full_messages).to include("")
    end
    
    it 'priceは300~9999999の間でないと保存できないこと' do
    end
    
    it 'userが結びついていないと保存できないこと' do
      #@item.user = nil
      #@item.valid?
      #expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end