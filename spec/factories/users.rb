FactoryBot.define do
  factory :user do
    nickname { 'ABC子' }
    email                 { Faker::Internet.free_email}
    password              { 'abc123' }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '隆太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'リクタロウ' }
    birthday { Date.new(2000, 11, 12) }
  end
end
