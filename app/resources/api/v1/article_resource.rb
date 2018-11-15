# frozen_string_literal: true

class Api::V1::ArticleResource < JSONAPI::Resource
  attributes :title, :content

  has_one :user
  has_many :comments
  filter :user
end
