FactoryBot.define do
    factory :user do
      nama { Faker::Name.name }
      email { Faker::Internet.email }
      password { "12345678" }
    end

    factory :message do
      chat { Faker::Lorem.sentence }
      associaton :user, factory :user
    end
end