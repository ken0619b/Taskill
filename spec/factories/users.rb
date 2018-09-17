require "faker"

FactoryBot.define do
  factory :user do
    sequence(:email) { Faker::Internet.unique.email }
    name { "test user" }
    password { "password" }
    password_confirmation { "password" }
  end
end
