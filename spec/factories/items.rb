FactoryBot.define do
  factory :item do
    name                  { "バナナ" }
    text                  { "新鮮なバナナです"}                
    category_id           { 2 }            
    condition_id          { 2 }           
    payer_id              { 2 }  
    area_id               { 2 }      
    delivery_date_id      { 2 }     
    price                 { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
 
  end
end
