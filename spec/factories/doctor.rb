FactoryBot.define do
  # factory :doctor do
  factory Doctor do
    name { Faker::Name.name }
    specialization { Faker::Lorem.sentence }
    available_times { Faker::Lorem.paragraph }
    hourly_rate { Faker::Lorem.sentence }    
  end
end

# name: 'Nandita 2', specialization: 'eye specialist', available_times: 'monday-friday', hourly_rate: 250 } }
      