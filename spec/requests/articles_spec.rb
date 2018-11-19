# frozen_string_literal: true

require "rails_helper"
require "json"

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user_with_articles, :auth) }
  let(:valid_attrs) {
    makeJsonRelationship("articles", nil, attributes_for(:article), [{ type: "user", id: user.id }])
  }
  let(:invalid_attrs) {
    makeJsonRelationship("articles", article.id, attributes_for(:article, title: nil), [{ type: "user", id: user.id }])
  }
  let(:invalid_id_attrs) {
    makeJsonRelationship("articles", -1, attributes_for(:article), [{ type: "user", id: user.id }])
  }
  let(:article) { create(:article, user: user) }
  let(:header) { { 'Accept': "application/vnd.api+json", 'Content-Type': "application/vnd.api+json" } }


  describe "/api/v1/articles" do
    context "GET" do
        context "logged in"
        before(:each) { get v1_articles_path("en", user.id), headers: header }
        it "should be returns success" do
          expect(response).to have_http_status(200)
        end

        it "should be returns a users list" do
          expect(json).not_to be_blank
          expect(json).not_to be_empty
          expect(json["data"].count).to be >= 1
        end
      end
    context "POST" do
      context "logged in" do
        context "valid article attributes" do
          before(:each) { post v1_articles_path("en"), params: valid_attrs, headers: authorization(user) }
          it { expect(response).to have_http_status(201) }


          it_behaves_like "an user article attributes" do
            let(:body) { json }
            let(:attrs) { JSON.parse(valid_attrs) }
          end
        end
      end
      context "logged out" do
        context "valid article attributes" do
          before(:each) { post v1_articles_path("en"), params: valid_attrs, headers: header }
          it { expect(response).to have_http_status(401) }
          it_behaves_like "a unauthorized error with message"
        end
      end
    end
  end
  describe "/v1/articles/:id" do
    context "GET" do
      context "logged in" do
        context "valid article attributes" do
          before(:each) { get v1_article_path("en", article.id), headers: authorization(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/vnd.api+json")
            expect(response).to have_http_status(200)
          end

          it "should be returns an article" do
            expect(response.body).not_to be_blank
            expect(json["data"]).not_to be_empty
          end
        end
        context "invalid user attributes" do
          before(:each) { get v1_article_path("en", 0), headers: header }

          it_behaves_like "a not found error", 0
        end
      end
    end
    context "logged out" do
      context "valid article attributes" do
        before(:each) { get v1_article_path("en", article.id), headers: header }
        it "should be returns success" do
          expect(response.content_type).to eq("application/vnd.api+json")
          expect(response).to have_http_status(200)
        end

        it "should be returns an article" do
          expect(response.body).not_to be_blank
          expect(json["data"]).not_to be_empty
        end
      end
    end
    context "PUT" do
      let(:new_valid_attrs) { makeJsonRelationship("articles", article.id, attributes_for(:article), [{ type: "user", id: user.id }]) }
      context "logged in" do
        context "valid_articles_attrs" do
          before(:each) { put v1_article_path("en", article.id), params: new_valid_attrs, headers: authorization(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/vnd.api+json")
            expect(response).to have_http_status(200)
          end
        end
        context "invalid_articles_attrs" do
          describe "invalid id" do
            before(:each) { put v1_article_path("en", -1), params: invalid_id_attrs, headers: authorization(user) }

            it_behaves_like "a not found error", -1
          end

          describe "invalid params" do
            before(:each) { put v1_article_path("en", article.id), params: invalid_attrs, headers: authorization(user) }

            it_behaves_like "a unprocessable error", :article
          end
        end
      end
      context "logged out" do
        context "valid article attributes" do
          before(:each) { put v1_article_path("en", article.id), params: new_valid_attrs, headers: header }
          it { expect(response).to have_http_status(401) }
          it_behaves_like "a unauthorized error with message"
        end
      end
    end
  end

    context "PATCH" do
      let(:new_valid_attrs) { makeJsonRelationship("articles", article.id, attributes_for(:article), [{ type: "user", id: user.id }]) }
      context "logged in" do
        context "valid_user_attrs" do
          before(:each) { patch v1_article_path("en", article.id), params: new_valid_attrs, headers: authorization(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/vnd.api+json")
            expect(response).to have_http_status(200)
          end
        end

        context "invalid_user_attrs" do
          describe "invalid id" do
            before(:each) { put v1_article_path("en", -1), params: invalid_id_attrs, headers: authorization(user) }

            it_behaves_like "a not found error", -1
          end

          describe "invalid params" do
            before(:each) { put v1_article_path("en", article.id), params: invalid_attrs, headers: authorization(user) }

            it_behaves_like "a unprocessable error", :article
          end
        end
      end
      context "logged out" do
        context "valid article attributes" do
          before(:each) { patch v1_article_path("en", article.id), params: new_valid_attrs, headers: header }
          it { expect(response).to have_http_status(401) }
          it_behaves_like "a unauthorized error with message"
        end
      end
    end

    context "DELETE" do
      context "when logged in" do
        context "valid_user_attrs" do
          before(:each) { delete v1_article_path("en", article.id), headers: authorization(user) }

          it "should destroy a user" do
            expect(response.body).to be_empty
            expect(response).to have_http_status(204)
          end
        end

        context "invalid_user_attrs" do
          before(:each) { delete v1_article_path("en", 0), headers: authorization(user) }

          it_behaves_like "a not found error", 0
        end
      end


  end
end
