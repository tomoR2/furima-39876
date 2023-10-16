FactoryBot.define do
  factory :order_address do
    post_code { "123-4567" }
    prefecture_id { 2 }
    municipality { "石巻" }
    street_address { "民芸調" }
    building_name { "花山ビル" }
    phone_number { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}

    end
end