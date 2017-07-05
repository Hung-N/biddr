FactoryGirl.define do
  factory :auction do
    title { Faker::Coffee.blend_name}
    description { Faker::Coffee.notes }
    reserve { rand(10..10000) }
  end
end
