# frozen_string_literal: true

class Docs::V1::CommentsController
  include Swagger::Blocks

  swagger_path "/v1/comments" do
    operation :post do
      key :description, "Creates a new comment in article."
      key :operationId, "addArticleComments"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Comments"
      ]

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end
      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
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

  swagger_path "/v1/comments/{id}" do
    operation :put do
      key :description, "Update comment informations in article"
      key :operationId, "updateComment"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Comments"
      ]
      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
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
        "Comments"
      ]
      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
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
