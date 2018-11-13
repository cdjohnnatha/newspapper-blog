# frozen_string_literal: true

module Api::V1
  class UserResource < JSONAPI::Resource
    attributes :name, :email, :password

    def fetchable_fields
      super - [:password]
    end
  end
end
