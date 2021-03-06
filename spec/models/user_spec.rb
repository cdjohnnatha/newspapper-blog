# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "should have a valid factory" do
    expect(build(:user, :auth)).to be_valid
  end
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    # it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_presence_of(:email) }
  end

  context "attributes" do
    it "has email" do
      expect(build(:user, email: "x@y.z")).to have_attributes(email: "x@y.z")
    end
    it "has name" do
      expect(build(:user, name: "testeName")).to have_attributes(name: "testeName")
    end
    it "has password" do
      expect(build(:user, password: "password123")).to have_attributes(password: "password123")
    end
  end

  context "relationships" do
    it { should have_many(:articles) }
    it { should have_many(:comments) }
  end

end
