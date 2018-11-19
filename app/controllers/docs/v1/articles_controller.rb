# frozen_string_literal: true

class Docs::V1::ArticlesController
  include Swagger::Blocks

  swagger_path "/v1/articles/" do
    operation :get do
      key :sumary, "Get all articles"
      key :description, "Returns all articles"
      key :operationId, "indexArticles"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Articles"
      ]
      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
      end
      response 200 do
        key :description, "articles response"
      end
    end
  end

  swagger_path "/v1/articles/{id}" do
    operation :get do
      key :sumary, "Get an articles"
      key :description, "Returns an article"
      key :operationId, "showArticle"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Articles"
      ]
      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
      end
      response 200 do
        key :description, "articles response"
      end
    end

    operation :post do
      key :description, "Creates a new article by user at store."
      key :operationId, "addArticle"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Articles"
      ]

      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
      end

      parameter do
        key :in, :body
        key :name, :user
        key :description, "Add article to store"
        key :required, true
        schema do
          key :'$ref', :ArticleInput
        end
      end
      response 200 do
        key :description, "article response"
        schema do
          key :'$ref', :Article
        end
      end
    end

    operation :put do
      key :description, "update an article by user."
      key :operationId, "updateArticle"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Articles"
      ]

      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
      end

      parameter do
        key :in, :body
        key :name, :user
        key :description, "Update article"
        key :required, true
        schema do
          key :'$ref', :ArticleInput
        end
      end
      response 200 do
        key :description, "article response"
        schema do
          key :'$ref', :Article
        end
      end
    end
    operation :delete do
      key :summary, "Delete an Article"
      key :description, "Delete an Article"
      key :operationId, "deleteArticle"
      key :tags, [
        "Articles"
      ]
      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of Article"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "article deleted"
      end
    end
  end
  swagger_path "/v1/articles/{id}/comments" do
    operation :get do
      key :sumary, "Get all comments from articles"
      key :description, "Returns comments from article"
      key :operationId, "showArticleComments"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Articles"
      ]
      security do
        key :uid, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
      end
      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of Article"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "articles response"
      end
    end
  end
end
