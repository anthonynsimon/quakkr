require 'faker'

FactoryGirl.define do
  factory :user do |f|
    # Temp fix: Internet.user_name generates special chars
    f.user_name Faker::Name.first_name
    f.email Faker::Internet.email
    f.password Faker::Internet.password(8, 20)
  end
end