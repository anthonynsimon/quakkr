require 'faker'

FactoryGirl.define do
  factory :notification do |f|
    f.user_id { Faker::Number.between(0, 1024) }
    f.notified_by_id { Faker::Number.between(0, 1024) }
    f.post_id { Faker::Number.between(0, 1024) }
    f.identifier { Faker::Number.between(0, 1024) }
    f.event_type { Faker::Number.between(0, 1024) }
  end
end