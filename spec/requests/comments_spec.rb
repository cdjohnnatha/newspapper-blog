# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:article) { create(:article) }
  let(:user) { create(:user) }
  let(:comment) { create(:comment, user: user, article: article) }
  let(:valid_attrs) {
    makeJsonRelationship("comments", nil, attributes_for(:comment), [{ type: "user", id: user.id }, type: "article", id: article.id])
  }
  let(:invalid_attrs) {
    makeJsonRelationship("comments", article.comments[0].id, attributes_for(:comment, content: nil), [{ type: "user", id: user.id }, type: "article", id: article.id])
  }
  let(:invalid_id_attrs) {
    makeJsonRelationship("comments", -1, attributes_for(:comment), [{ type: "user", id: user.id }, type: "article", id: article.id])
  }
  let(:header) { { 'Accept': "application/vnd.api+json", 'Content-Type': "application/vnd.api+json" } }

  describe "/api/v1/comments" do
    context "GET" do
      context "logged in" do
        before { create(:comment, article: article, user: user) }
        before(:each) { get v1_article_comments_path("en", article.id), headers: authorization(user) }
        it "should be returns success" do
          expect(response).to have_http_status(200)
        end

        it "should be returns a comments list from an article" do
          expect(json).not_to be_blank
          expect(json).not_to be_empty
          expect(json["data"].count).to be >= 1
        end
      end
    end
    context "GET" do
      context "logged out" do
        before { create(:comment, article: article, user: user) }
        before(:each) { get v1_article_comments_path("en", article.id), headers: header }
        it "should be returns success" do
          expect(response).to have_http_status(200)
        end

        it "should be returns a comments list from an article" do
          expect(json).not_to be_blank
          expect(json).not_to be_empty
          expect(json["data"].count).to be >= 1
        end
      end
    end

    context "POST" do
      context "logged in" do
        context "valid comments attributes" do
          before(:each) { post v1_comments_path("en"), params: valid_attrs, headers: authorization(user) }
          it { expect(response).to have_http_status(201) }

          it_behaves_like "a comment attributes" do
            let(:body) { json }
            let(:attrs) { JSON.parse(valid_attrs) }
          end

          it_behaves_like "a comment response" do
            let(:body) { json }
            let(:attrs) { JSON.parse(valid_attrs) }
          end
        end
      end
      context "logged out" do
        before(:each) { post v1_comments_path("en"), headers: header }
        it_behaves_like "a unauthorized error with message"
      end
    end

    describe "/v1/comments" do
      context "PUT" do
        let(:new_valid_attrs) {
          makeJsonRelationship("comments", comment.id, attributes_for(:comment), [{ type: "user", id: user.id }, type: "article", id: article.id])
        }
        context "logged in" do
          context "valid_user_attrs" do
            before(:each) { put v1_comment_path("en", comment.id), params: new_valid_attrs, headers: authorization(user) }

            it "should be returns success" do
              expect(response.content_type).to eq("application/vnd.api+json")
              expect(response).to have_http_status(200)
            end

            it_behaves_like "a comment attributes" do
              let(:body) { json }
              let(:attrs) { JSON.parse(new_valid_attrs) }
            end
          end

          context "invalid_comments_attrs" do
            describe "invalid id" do
                before(:each) { put v1_comment_path("en", -1), params: invalid_id_attrs, headers: authorization(user) }

                it_behaves_like "a not found error", -1
              end

            describe "invalid params" do
              before(:each) { put v1_comment_path("en", comment.id), params: invalid_attrs, headers: authorization(user) }

              it_behaves_like "a unprocessable error", :user
            end
          end
        end
        context "logged out" do
          before(:each) { put v1_comment_path("en", comment.id), params: new_valid_attrs, headers: header }
          it_behaves_like "a unauthorized error with message"
        end
      end
    end


    context "DELETE" do
      context "when logged in" do
        context "valid_article_comment_attrs" do
          before(:each) { delete v1_comment_path("en", comment.id), headers: authorization(user) }

          it "should destroy a comment" do
            expect(response.body).to be_empty
            expect(response).to have_http_status(204)
          end
        end

        context "invalid_comment_attrs" do
          before(:each) { delete v1_comment_path("en", 0), headers: authorization(user) }

          it_behaves_like "a not found error", 0
        end
      end
      context "when logged out" do
        before(:each) { delete v1_comment_path("en", comment.id), headers: header }
        it_behaves_like "a unauthorized error with message"
      end
    end
  end
end
