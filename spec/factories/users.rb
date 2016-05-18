require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.user_name { Faker::Internet.user_name(4..26).gsub(/[.]/, '') }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(8, 20) }
  end
end