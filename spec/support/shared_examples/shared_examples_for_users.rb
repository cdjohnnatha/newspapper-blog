# frozen_string_literal: true

RSpec.shared_examples "an user registration" do
  it "should be returns an user attributes" do
    expect(json["data"]).not_to be_blank
    expect(json["data"]).not_to be_empty
    expect(json).to have_key("data")
    expect(json).to have_key("status")
    expect(json["status"]).to eq("success")
    expect(json["data"]).to have_key("id")
    expect(json["data"]).to have_key("provider")
    expect(json["data"]).to have_key("uid")
    expect(json["data"]).to have_key("name")
    expect(json["data"]["name"]).to eq(attrs["name"])
    expect(json["data"]["uid"]).to eq(attrs["email"])
  end
end

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
    expect(json["data"]["attributes"]["nickname"]).to eq(attrs.nickname)
    expect(json["data"]["attributes"]["email"]).to eq(attrs.email)
  end
end
