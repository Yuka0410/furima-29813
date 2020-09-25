FactoryBot.define do
  factory :item do
    name                  { "バナナ" }
    text                  { "新鮮なバナナです"}                
    category_id           { 1 }            
    condition_id          { 1 }           
    payer_id              { 1 }  
    area_id               { 1 }      
    delivery_date_id      { 1 }     
    price                 { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
 
  end
end
