FactoryGirl.define do
  factory :url do
    short_url_key { FactoryGirl.generate(:short_url_key_sequence) }
    url { "http://#{Faker::Internet.domain_name}" }
    url_views 0
    association :user, :factory => :user
  end
  sequence :short_url_key_sequence do |n|
    "1234#{n}"
  end
  factory :user do
    email { Faker::Internet.email }
    password "password"
  end
end
