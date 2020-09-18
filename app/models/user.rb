class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #まだ他モデル未実装のためコメントアウト
         #has_many :items
         #has_many :purchases
#ここのend必要？

  #注意！見本はfirst_name,last_nameにしているが本アプリはfamily_nameとfirst_nameにしてしまった
  validates :password_confirmation, presence: {message: "doesn't match Password"}

  with_options presence: true do 
         validates :nickname
         validates :birthday
         validates :password, length: { minimum: 6 } #,{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
                      
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #PASSWORD_REGEXの変数にpasswordを代入している
          validates_format_of :password, with: PASSWORD_REGEX, message: "Password Include both letters and numbers" 
          validates_format_of :password_confirmation, with: PASSWORD_REGEX, message: "Password_confirmation Include both letters and numbers"
  end     
  
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"} do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"} do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }#これは大文字、小文字を区別しなくなる
                    #メッセージはブラウザに出る？

  

end

#validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
 #もし後でメッセージ表記も含めるなら上記のように書く。参照：寄付アプリのところ。