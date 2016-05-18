require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.user_id { Faker::Number.between(0, 1024) }
    f.message { Faker::Lorem.sentence }
  end
end