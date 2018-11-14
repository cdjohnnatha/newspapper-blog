# frozen_string_literal: true

RSpec.shared_examples "an user attributes" do
  it "should be returns an user attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["name"]).to eq(attrs["data"]["attributes"]["name"])
    expect(json["data"]["attributes"]["email"]).to eq(attrs["data"]["attributes"]["email"])
  end
end

RSpec.shared_examples "an user object" do
  it "should be returns an user attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["attributes"]["name"]).to eq(attrs.name)
    expect(json["data"]["attributes"]["email"]).to eq(attrs.email)
  end
end
