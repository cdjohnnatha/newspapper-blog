# frozen_string_literal: true

class Api::V1::ArticleResource < JSONAPI::Resource
  attributes :title, :content

  has_one :user
  filter :user
end
