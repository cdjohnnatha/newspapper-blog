# frozen_string_literal: true

class Api::V1::ArticleResource < Api::V1::BaseResource
  attributes :title, :content

  has_one :user
  has_many :comments
  filter :user
end
