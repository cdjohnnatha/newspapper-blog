# frozen_string_literal: true

module Api::V1
  class UserResource < Api::V1::BaseResource
    has_many :articles
    has_many :comments

    attributes :email, :password

    def fetchable_fields
      super - [:password]
    end
  end
end
