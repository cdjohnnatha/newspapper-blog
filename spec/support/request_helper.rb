# frozen_string_literal: true
require 'rails_helper'
include ActionController::RespondWith

module RequestHelper
  def json
    JSON.parse(response.body)
  end
  def makeJson(className, id, attributes)
    object = { data: { type: className, attributes: attributes } }
    unless id.nil?
      object[:data][:id] = id
    end
    object.to_json
  end
  def buildParents(parents)
    parents = parents.map do |element|
      {
        "#{element[:type]}": {
          data: {
            type: "#{element[:type].pluralize}",
            id: "#{element[:id]}"
          }
        }
      }
    end
    parents.map { |element| [element.keys.first, element[element.keys.first] ] }.to_h
  end

  def makeJsonRelationship(className, id, attributes, parents)
    object = JSON.parse(makeJson(className, id, attributes))
    parents = buildParents(parents)
    object["data"]["relationships"] = parents
    object.to_json
  end

  def authorization(user)
    auth_headers = user.create_new_auth_token
    auth_headers["Accept"] = "application/vnd.api+json"
    auth_headers["Content-Type"] = "application/vnd.api+json"
    auth_headers
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
