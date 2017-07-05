FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.email.gsub('@', "-#{n}@") }
    password '123123'
  end
end
