require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "should have a valid factory" do
    expect(build(:comment)).to be_valid
  end
  context "validations" do
    it { should validate_presence_of(:content) }
  end

  context "attributes" do
    it "has content" do
      expect(build(:comment, content: "Any content large")).to have_attributes(content: "Any content large")
    end
  end
  context "relationships" do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end
end
