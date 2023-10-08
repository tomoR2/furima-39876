FactoryBot.define do
  factory :item do
    item_name { 'ふぇいかー' }
    concept { '商品説明' }
    category_id { 2 }
    condition_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    delivery_days_id { 2 }
    price { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_三井寿.jpg'), filename: 'test_三井寿.jpg')
    end
  end
end
