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
        "articles"
      ]
      security do
        key :auth, []
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
        "articles"
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
        key :description, "articles response"
      end
    end
  end

  swagger_path "/users/{id}/articles/" do
    operation :get do
      key :sumary, "Get all articles from user"
      key :description, "Returns all articles"
      key :operationId, "indexUserArticles"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "user articles"
      ]
      security do
        key :auth, []
      end
      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of user"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "articles response"
      end
    end

    operation :post do
      key :description, "Creates a new article at store."
      key :operationId, "addArticle"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "user articles"
      ]

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of user"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :article
        key :description, "Add article to store"
        key :required, true
        schema do
          key :'$ref', :ArticleInput
        end
      end
      response 200 do
        key :description, "article response"
        schema do
          key :'$ref', :article
        end
      end
    end
  end

  swagger_path "/v1/users/{user_id}/articles/{id}" do
    operation :get do
      key :description, "Returns a single article"
      key :operationId, "findarticleById"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "user articles"
      ]
      security do
        key :auth, []
      end
      parameter do
        key :in, :path
        key :name, :user_id
        key :description, "Id of user"
        key :required, true
        key :type, :integer
      end
      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "article response"
        schema do
          key :'$ref', :article
        end
      end
    end

    operation :put do
      key :description, "Update article informations"
      key :operationId, "updatearticle"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "user articles"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :user_id
        key :description, "Id of user"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :article
        key :description, "Update article at store"
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
      key :summary, "Delete an article"
      key :description, "Delete an article"
      key :operationId, "deletearticle"
      key :tags, [
        "user articles"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :user_id
        key :description, "Id of user"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of article"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "article deleted"
      end
    end
  end
end
