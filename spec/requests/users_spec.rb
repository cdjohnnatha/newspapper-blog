# frozen_string_literal: true

require "rails_helper"
require "json"

RSpec.describe "Users", type: :request do
  let(:valid_attrs) { attributes_for(:user).to_json }
  let(:valid_attrs_auth) { attributes_for(:user, :auth).to_json }

  let(:user) { create(:user, :auth) }
  let(:header_auth) { { 'Content-Type': "application/json" } }
  let(:header) { { 'Accept': "application/vnd.api+json", 'Content-Type': "application/vnd.api+json" } }
  let(:invalid_attrs) { makeJson("users", user.id, attributes_for(:user, name: nil)) }
  let(:invalid_id_attrs) { makeJson("users", -1, attributes_for(:user, name: nil)) }

  describe "/api/v1/users" do
    context "POST" do
      context "valid user attributes" do
        before(:each) { post user_registration_path, params: valid_attrs_auth, headers: header_auth}
        it { expect(response).to have_http_status(200) }


        it_behaves_like "an user registration" do
          let(:body) { json }
          let(:attrs) { JSON.parse(valid_attrs_auth) }
        end
      end
    end
  end
  describe "/v1/users/:id" do
    context "GET" do
      context "logged in" do
        before(:each) { get v1_user_path("en", user.id), headers: authorization(user) }

        it "should be returns success" do
          expect(response.content_type).to eq("application/vnd.api+json")
          expect(response).to have_http_status(200)
        end

        it "should be returns an user" do
          expect(response.body).not_to be_blank
          expect(json["data"]).not_to be_empty
        end

        it_behaves_like "an user object" do
          let(:body) { json }
          let(:attrs) { user }
        end
        context "invalid user attributes" do
          before(:each) { get v1_user_path("en", 0), headers: authorization(user) }

          it_behaves_like "a not found error", 0
        end
      end
      context "logged out" do
        before(:each) { get v1_user_path("en", 1), headers: header }
        it_behaves_like "a unauthorized error with message", 1
      end
    end

    context "PUT" do
      let(:new_valid_attrs) { makeJson("users", user.id, attributes_for(:user)) }
      context "logged in" do
        context "valid_user_attrs" do
          before(:each) { put v1_user_path("en", user.id), params: new_valid_attrs, headers: authorization(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/vnd.api+json")
            expect(response).to have_http_status(200)
          end
          it_behaves_like "an user attributes" do
            let(:body) { json }
            let(:attrs) { JSON.parse(new_valid_attrs) }
          end
        end

        context "invalid_user_attrs" do
          describe "invalid id" do
            before(:each) { put v1_user_path("en", -1), params: invalid_id_attrs, headers: authorization(user) }

            it_behaves_like "a not found error", -1
          end

          describe "invalid params" do
            before(:each) { put v1_user_path("en", user.id), params: invalid_attrs, headers: authorization(user) }

            it_behaves_like "a unprocessable error", :user
          end
        end
      end

      context "logged out" do
        before(:each) { put v1_user_path("en", user.id), params: new_valid_attrs, headers: header }
        it_behaves_like "a unauthorized error with message", 1
      end
    end

    context "PATCH" do
      let(:new_valid_attrs) { makeJson("users", user.id, attributes_for(:user)) }

      context "when logged in" do
        context "valid_user_attrs" do
          before(:each) { patch v1_user_path("en", user.id), params: new_valid_attrs, headers: authorization(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/vnd.api+json")
            expect(response).to have_http_status(200)
          end
        end

        context "invalid_user_attrs" do
          describe "invalid id" do
            before(:each) { patch v1_user_path("en", -1), params: invalid_id_attrs, headers: authorization(user)  }

            it_behaves_like "a not found error", -1
          end

          describe "invalid params" do
            before(:each) { patch v1_user_path("en", user.id), params: invalid_attrs, headers: authorization(user) }

            it_behaves_like "a unprocessable error", :user
          end
        end
      end
      context "logged out" do
        before(:each) { patch v1_user_path("en", user.id), params: new_valid_attrs, headers: header }
        it_behaves_like "a unauthorized error with message", 1
      end
    end

    context "DELETE" do
      context "when logged in" do
        context "valid_user_attrs" do
          before(:each) { delete user_registration_path("en", user.id), headers: authorization(user) }

          it "should destroy a user" do
            expect(json["message"]).to eq("Account with UID '#{user.email}' has been destroyed.")
            expect(json["status"]).to eq("success")
            expect(response).to have_http_status(200)
          end
        end

        # context "invalid_user_attrs" do
        #   before(:each) { delete user_registration_path("en", -1), headers: authorization(user) }

        #   it_behaves_like "a not found error", 0
        # end
      end
      # context "logged out" do
      #   before(:each) { delete user_registration_path("en", user.id), headers: header }
      #   it_behaves_like "a unauthorized error with message", 1
      # end
    end
  end
end
