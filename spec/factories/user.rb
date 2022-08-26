FactoryBot.define do
  factory :user do
    username { 'Joe' }
    password_digest { 'password' }
    role { 'regular' }
  end
end

#     username { Faker::Name.name }
#     password_digest { Faker::Lorem.sentence }
#     role { Faker::Lorem.sentence }
