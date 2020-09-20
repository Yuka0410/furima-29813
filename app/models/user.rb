class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #まだ他モデル未実装のためコメントアウト
         #has_many :items
         #has_many :purchases


  #注意！見本はfirst_name,last_nameにしているが本アプリはfamily_nameとfirst_nameにしてしまった
  

  with_options presence: true do 
         validates :nickname
         validates :birthday
  end
         validates :password, presence: true
         validates :password, length: { minimum: 6 } #,{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         validates :password_confirmation, presence: true             
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #PASSWORD_REGEXの変数にpasswordを代入している
          validates_format_of :password, with: PASSWORD_REGEX, message: "include both letters and numbers" 
          validates_format_of :password_confirmation, with: PASSWORD_REGEX, message: "include both letters and numbers"
       
  
  
  #with_options presence: true do もしdryに沿って文章整理するならこれ使う/error文変える必要あるため注意。

    validates :family_name, presence: true 
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"}
    validates :first_name, presence: true
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"}
  #end

  #with_options presence: true do
    validates :family_name_kana, presence: true
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :first_name_kana, presence: true
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  #end

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }#これは大文字、小文字を区別しなくなる
                    #メッセージはブラウザに出る？
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  

end

#validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
 #もし後でメッセージ表記も含めるなら上記のように書く。参照：寄付アプリのところ。