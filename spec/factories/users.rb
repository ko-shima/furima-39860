FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name              {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    birthday              {Faker::Date.birthday}
  end
end

