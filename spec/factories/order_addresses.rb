FactoryBot.define do
  factory :order_address do
    post_code           { '123-4567' }
    area_id             { 2 }
    city                { '大阪市' }
    house_number        { '大阪１−１' }
    phone_number        { '09012345678' }

    association :user
    association :item
  end
end
