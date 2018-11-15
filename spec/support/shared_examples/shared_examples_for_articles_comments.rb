# frozen_string_literal: true

RSpec.shared_examples "a comment attributes" do
  it "should be returns a comment attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["type"]).to eq(attrs["data"]["type"])
    expect(json["data"]["attributes"]).not_to be_blank
    expect(json["data"]["attributes"]).not_to be_empty
    expect(json["data"]["attributes"]["content"]).to eq(attrs["data"]["attributes"]["content"])
  end
end


RSpec.shared_examples "a comment response" do
  it "should be returns a comment attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json["data"]["type"]).to eq(attrs["data"]["type"])
    expect(json["data"]["attributes"]).not_to be_blank
    expect(json["data"]["attributes"]).not_to be_empty
    expect(json["data"]["attributes"]["content"]).to eq(attrs["data"]["attributes"]["content"])
    expect(json["data"]).to have_key("relationships")
    expect(json["data"]["relationships"]).to have_key("user")
    expect(json["data"]["relationships"]).to have_key("article")
    expect(json["data"]["relationships"]["user"]).to have_key("links")
    expect(json["data"]["relationships"]["article"]).to have_key("links")
  end
end