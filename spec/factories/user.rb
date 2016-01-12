require 'factory_girl'
require 'forgery'

FactoryGirl.define do
  factory :user do
    name { Forgery('name').first_name }
    email { generate(:email) }
    password { "test1234" }
  end
end

FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
end