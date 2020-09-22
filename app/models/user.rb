class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # まだ他モデル未実装のためコメントアウト
  has_many :items
  # has_many :purchases

  # 注意！見本はfirst_name,last_nameにしているが本アプリはfamily_nameとfirst_nameにしてしまった

  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  validates :password, presence: true
  validates :password, length: { minimum: 6 } 
  validates :password_confirmation, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze 
  validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers'
  validates_format_of :password_confirmation, with: PASSWORD_REGEX, message: 'include both letters and numbers'

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates_format_of :family_name, with: NAME_REGEX, message: 'Full-width characters'
  validates_format_of :first_name, with: NAME_REGEX, message: 'Full-width characters'
  validates :family_name, presence: true
  validates :first_name, presence: true
 
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :family_name_kana, with: KANA_REGEX, message: 'Full-width katakana characters'
  validates_format_of :first_name_kana, with: KANA_REGEX, message: 'Full-width katakana characters'
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false } # これは大文字、小文字を区別しなくなる
  # @メッセージはブラウザに出るため不要
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
end

