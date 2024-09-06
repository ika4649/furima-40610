FactoryBot.define do
  factory :order_form do
    association :user
    association :item
    postal_code{ Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s} 
    prefecture_id{ Faker::Number.between(from: 2, to: 47) } # 日本の都道府県ID（1は除外）
    city{ Faker::Address.city }
    address{ Faker::Address.street_address }
    building_name{ Faker::Address.secondary_address }
    phone_number{ Faker::PhoneNumber.subscriber_number(length: 10) } # 10桁の電話番号
  end
end  