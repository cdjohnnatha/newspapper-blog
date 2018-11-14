# frozen_string_literal: true

RSpec.shared_examples "an user article attributes" do
  it "should be returns an user attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["type"]).to eq(attrs["data"]["type"])
    expect(json["data"]["attributes"]).not_to be_blank
    expect(json["data"]["attributes"]).not_to be_empty
    expect(json["data"]["attributes"]["title"]).to eq(attrs["data"]["attributes"]["title"])
    expect(json["data"]["attributes"]["content"]).to eq(attrs["data"]["attributes"]["content"])
  end
end
