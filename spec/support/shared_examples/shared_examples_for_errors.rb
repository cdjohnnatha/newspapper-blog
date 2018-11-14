# frozen_string_literal: true

RSpec.shared_examples "a unauthorized error" do
  it "should be returns an unauthorized error" do
    expect(response).to have_http_status(401)
  end

  it "should not be returns aunauthorized message" do
    expect(response.body).to be_blank
    expect(response.body).to be_empty
  end
end

RSpec.shared_examples "a unauthorized error with message" do
  it "should be returns an unauthorized error" do
    expect(response).to have_http_status(401)
  end

  it "should not be returns aunauthorized message" do
    expect(response.body).to_not be_blank
    expect(response.body).to_not be_empty
    expect(response.body).to eq('{"message":"You are not authorized to access this page."}')
  end
end

RSpec.shared_examples "a not found error" do |id|
  let(:entity) { model.to_s.classify }
  let(:entity_id) { id.to_s }

  it "should be returns not found error" do
    expect(response).to have_http_status(404)
  end

  it "should be returns not found message" do
    expect(response.body).not_to be_blank
    expect(response.body).not_to be_empty
    expect(response.body).to eq('{"errors":[{"title":"Record not found","detail":"The record identified by ' + id.to_s + ' could not be found.","code":"404","status":"404"}]}')
  end
end

RSpec.shared_examples "a unprocessable error" do |model|
  let(:entity) { model.to_s.classify }

  it "should be returns unprocessable error" do
    expect(response).to have_http_status(422)
  end

  it "should be returns unprocessable fields" do
    expect(response.body).not_to be_blank
    expect(response.body).not_to be_empty
  end
end
