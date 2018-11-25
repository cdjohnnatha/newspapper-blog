# frozen_string_literal: true

class Api::V1::ArticleResource < Api::V1::BaseResource
  attributes :title, :content, :updated_at

  has_one :user, always_include_linkage_data: true
  has_many :comments
  filter :user
  def self.default_sort
    [{field: :updated_at, direction: :desc}]
  end
end
