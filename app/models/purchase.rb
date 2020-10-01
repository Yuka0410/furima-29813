class Purchase < ApplicationRecord
  attr_accessor :token #Payjpに値段情報送る必要があるなら , :price を入れて

  belongs_to :user
  belongs_to :item
  has_one :address

  validates :token, presence: true #他のバリデーションは他のモデルにいれるか
  


end
