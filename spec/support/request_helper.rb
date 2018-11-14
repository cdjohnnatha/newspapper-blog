# frozen_string_literal: true

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
  def makeJsonRelationship(className, id, attributes, parentClassName, parentId)
    object = JSON.parse(makeJson(className, id, attributes))
    relationObject = { "#{parentClassName}": { data: { "type": "#{parentClassName.pluralize}", "id": "#{parentId}" } } }
    object["data"]["relationships"] = relationObject
    object.to_json
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
