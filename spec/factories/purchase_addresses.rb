FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    area_id { 6 }
    city { '大阪' }
    block { '1-1' }
    building_name { '兵庫ハイツ' }
    phone_number { 09082018999 }
  end
end
