require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'family_nameが空だと保存できないこと' do  # バリデーションに重複あり、エラーメッセージ２つ書く
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name Full-width characters')
    end
    it 'family_nameが全角日本語でないと保存できないこと' do
      @user.family_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name Full-width characters')
    end
    it 'first_nameが空だと保存できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = 'ﾘｸﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'family_name_kanaが全角カタカナでないと保存できないこと' do
      @user.family_name_kana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
    end
    it 'first_name_kanaが全角カタカナでないと保存できないこと' do
      @user.first_name_kana = 'ﾘｸﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'email空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが@を含んでいないと保存できないこと' do
      @user.email = 'aaa.aaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordは空だと保存できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では保存できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは半角英数を含まないと保存できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password include both letters and numbers', 'Password confirmation include both letters and numbers')
    end
    it 'password_confirmationが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationは半角英数を含まないと保存できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers", "Password confirmation include both letters and numbers")
    end
    it 'passwordが存在してもpassword_confirmationが空では保存できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'birthdayが空では保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

# it 'password_confirmationがpasswordと一致しないと保存できないこと' do
# devise が表示してくれるので不要！

# passwordの一意性はセキリュティ面でできないので不要
