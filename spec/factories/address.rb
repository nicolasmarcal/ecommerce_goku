require 'factory_girl'
require 'forgery'

FactoryGirl.define do
  factory :address do
    zip_code { "12062640" }
    street { Forgery('name').first_name }
    state { Forgery('name').first_name }
    city { Forgery('name').first_name }
    neighborhood { Forgery('name').first_name }
  end
end
