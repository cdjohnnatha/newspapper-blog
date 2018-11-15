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
    parents.map{ |element| [element.keys.first, element[element.keys.first] ] }.to_h
  end

  def makeJsonRelationship(className, id, attributes, parents)
    object = JSON.parse(makeJson(className, id, attributes))
    parents = buildParents(parents)
    object["data"]["relationships"] = parents
    object.to_json
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
