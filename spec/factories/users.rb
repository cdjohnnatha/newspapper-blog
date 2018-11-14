# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet::email }
    password { Faker::Internet::password }

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
