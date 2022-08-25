FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password_digest { Faker::Lorem.sentence }
    role { Faker::Lorem.sentence }
  end
end
