FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }

    user
    article
  end
end
