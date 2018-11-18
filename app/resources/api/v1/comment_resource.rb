# frozen_string_literal: true

class Api::V1::CommentResource < Api::V1::BaseResource
  attribute :content

  has_one :user
  has_one :article
end
