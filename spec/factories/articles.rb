# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }

    user

    # article_with_comments will create comments data after the user has been created
    factory :article_with_comments do
     transient do
       comments_count { 5 }
     end
     after(:create) do |article, evaluator|
       create_list(:comment, evaluator.comments_count, article: article)
     end
   end
  end
end
