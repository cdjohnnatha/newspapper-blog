# frozen_string_literal: true

class Docs::V1::ArticlesCommentsController
  include Swagger::Blocks

  swagger_path "/v1/articles/{id}/comments" do
    operation :get do
      key :sumary, "Get all comments from article"
      key :description, "Returns all articles"
      key :operationId, "indexArticleComments"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "articles comments"
      ]
      security do
        key :auth, []
      end
      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "comments response"
      end
    end

    operation :post do
      key :description, "Creates a new comment in article."
      key :operationId, "addArticleComments"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "articles comments"
      ]

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :comment
        key :description, "Add comment in article"
        key :required, true
        schema do
          key :'$ref', :CommentInput
        end
      end
      response 200 do
        key :description, "article comment response"
        schema do
          key :'$ref', :Comment
        end
      end
    end
  end

  swagger_path "/v1/articles/{article_id}/comments/{id}" do
    operation :put do
      key :description, "Update comment informations in article"
      key :operationId, "updateComment"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "articles comments"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :article_id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of comment"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :comment
        key :description, "Update comment in article"
        key :required, true
        schema do
          key :'$ref', :CommentInput
        end
      end

      response 200 do
        key :description, "comment response"
        schema do
          key :'$ref', :Comment
        end
      end
    end

    operation :delete do
      key :summary, "Delete an comment"
      key :description, "Delete an comment"
      key :operationId, "deleteComment"
      key :tags, [
        "articles comments"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :article_id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of comment"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "comment deleted"
      end
    end
  end
end
