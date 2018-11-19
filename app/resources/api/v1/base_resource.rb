# frozen_string_literal: true

class Api::V1::BaseResource < JSONAPI::Resource
  include JSONAPI::Authorization::PunditScopedResource
  abstract
end
