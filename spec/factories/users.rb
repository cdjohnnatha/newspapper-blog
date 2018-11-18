# frozen_string_literal: true

require "faker"

FactoryBot.define do
  passwords = Faker::Internet::password
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Internet.username }
    email { Faker::Internet::email }

    trait :auth do
      password { '12345678' }
      password_confirmation { '12345678' }
    end

    # user_with_articles will create articles data after the user has been created
    factory :user_with_articles do
      transient do
        articles_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:article, evaluator.articles_count, user: user)
      end
    end
  end
end
