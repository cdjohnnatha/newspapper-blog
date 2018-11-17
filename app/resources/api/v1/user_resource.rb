# frozen_string_literal: true

module Api::V1
  class UserResource < JSONAPI::Resource
    has_many :articles
    has_many :comments

    attributes :name, :email, :password, :nickname

    def fetchable_fields
      super - [:password]
    end
  end
end
