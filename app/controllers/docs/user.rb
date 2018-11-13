# frozen_string_literal: true

class Docs::User
  include Swagger::Blocks

  swagger_schema :User do
    key :format, :object
    key :required, [:data, :included]

    property :data do
      key :format, :object
      key :required, [:id, :type, :attributes]

      property :id do
        key :type, :integer
      end

      property :type do
        key :type, :string
      end

      property :attributes do
        key :format, :object
        key :required, [:name, :email, :password]

        property :id do
          key :type, :integer
        end

        property :name do
          key :type, :string
        end

        property :email do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :UserInput do
    key :required, [:user]

    property :user do
      key :format, :object
      key :required, [:name, :email, :password]

      property :name do
        key :type, :string
      end

      property :email do
        key :type, :string
      end

      property :password do
        key :type, :string
      end
    end
  end
end
