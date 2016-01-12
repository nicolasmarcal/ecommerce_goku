require 'factory_girl'
require 'forgery'

FactoryGirl.define do
  factory :address do
    zip_code { generate(:zip_code) }
    street { Forgery('name').first_name }
    state { Forgery('name').first_name }
    city { Forgery('name').first_name }
    neighborhood { Forgery('name').first_name }
  end
end

FactoryGirl.define do
  sequence :zip_code do |n|
    "12062-64#{n}"
  end
end