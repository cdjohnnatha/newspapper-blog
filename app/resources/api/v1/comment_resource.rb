# frozen_string_literal: true

class Api::V1::CommentResource < Api::V1::BaseResource
  attributes :content, :updated_at

  has_one :user, always_include_linkage_data: true
  has_one :article, always_include_linkage_data: true

  def self.default_sort
    [{field: :updated_at, direction: :desc}]
  end
end
