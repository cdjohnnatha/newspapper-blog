# frozen_string_literal: true
require "faker"

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }

    user
  end
end
