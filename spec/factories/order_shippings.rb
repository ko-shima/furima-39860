FactoryBot.define do
  factory :order_shipping do
    user_id      { Faker::Number.non_zero_digit }
    item_id      { Faker::Number.non_zero_digit }
    postal_code  { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    region_id    { Faker::Number.between(from: 2, to: 48) }
    city         { Faker::Address.city }
    block        { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    building     { Faker::Address.street_address }
    token        { Faker::Internet.password(max_length: 30) }
  end
end
