FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    articles { nil }
  end
end
