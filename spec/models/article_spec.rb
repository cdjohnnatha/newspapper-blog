# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do
  it "should have a valid factory" do
    expect(build(:article)).to be_valid
  end
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  context "attributes" do
    it "has title" do
      expect(build(:article, title: "testTitle")).to have_attributes(title: "testTitle")
    end
    it "has name" do
      expect(build(:article, content: "Any content large")).to have_attributes(content: "Any content large")
    end
  end
end
