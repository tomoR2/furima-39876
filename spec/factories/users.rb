FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    sequence(:email) { |n|Faker::Internet.email.gsub("@", "#{n}@")}
    password {"a1"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
     family_name {"山田"}
     first_name {"たろう"}
     family_name_kana {"ヤマダ"}
     first_name_kana {"タロウ"}
     birth_day {"1930-01-01"} 
     
  end
end