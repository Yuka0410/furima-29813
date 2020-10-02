class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  # 購入機能は全てformオブジェクトにおくのでこちらバリデーション不要。OKアソシエーションは必要。
end
