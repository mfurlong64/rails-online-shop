FactoryGirl.define do
  factory :category_product do
    
  end
  factory :category do
    name "MyString"
  end
  factory :user do
    username "MyString"
    email "MyString"
    password "MyString"
  end
  factory :product do
    name { Faker::Hipster.words }
    description { Faker::Hipster.sentences }
    price { Faker::Number.decimal(2) }
  end
end
