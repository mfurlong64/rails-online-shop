FactoryGirl.define do
  factory :product do
    name { Faker::Hipster.words }
    description { Faker::Hipster.sentences }
    price { Faker::Number.decimal(2) }
  end
end
