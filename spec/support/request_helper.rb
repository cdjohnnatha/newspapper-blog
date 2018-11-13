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
end

RSpec.configure do |config|
  config.include RequestHelper
end
