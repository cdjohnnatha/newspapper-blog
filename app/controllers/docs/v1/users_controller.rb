# frozen_string_literal: true

class Docs::V1::UsersController
  include Swagger::Blocks

  swagger_path "/v1/users" do
    operation :post do
      key :description, "Creates a new user at store. Email is unique"
      key :operationId, "addUser"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Users"
      ]

      parameter do
        key :in, :body
        key :name, :user
        key :description, "Add user to store"
        key :required, true
        schema do
          key :'$ref', :UserInput
        end
      end
      response 200 do
        key :description, "user response"
        schema do
          key :'$ref', :User
        end
      end
    end
  end

  swagger_path "/v1/users/{id}" do
    operation :get do
      key :description, "Returns a single user"
      key :operationId, "findUserById"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Users"
      ]
      security do
        key :auth, []
        key :tokenType, []
        key :accessToken, []
        key :client, []
      end
      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of user"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "user response"
        schema do
          key :'$ref', :User
        end
      end
    end

    operation :put do
      key :description, "Update user informations"
      key :operationId, "updateUser"
      key :produces, [
        "application/vnd.api+json"
      ]
      key :tags, [
        "Users"
      ]
      security do
        key :auth, []
        key :tokeyType, []
        # key :uid, []
        # key "token-type", []
        # key "access-token", []
        # key :client, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of user"
        key :required, true
        key :type, :integer
      end

      parameter do
        key :in, :body
        key :name, :user
        key :description, "Update user at store"
        key :required, true
        schema do
          key :'$ref', :User
        end
      end

      response 200 do
        key :description, "user response"
        schema do
          key :'$ref', :User
        end
      end
    end

    operation :delete do
      key :summary, "Delete an User"
      key :description, "Delete an User"
      key :operationId, "deleteUser"
      key :tags, [
        "Users"
      ]
      security do
        key :auth, []
      end

      parameter do
        key :in, :path
        key :name, :id
        key :description, "Id of User"
        key :required, true
        key :type, :integer
      end
      response 204 do
        key :description, "user deleted"
      end
    end
  end
end
