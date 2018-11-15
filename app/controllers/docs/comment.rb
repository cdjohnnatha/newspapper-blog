# frozen_string_literal: true

class Docs::Comment
  include Swagger::Blocks

  swagger_schema :Comment do
    key :format, :object
    key :required, [:data]

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
        key :required, [:content]

        property :id do
          key :type, :integer
        end

        property :content do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :CommentInput do
    property :data do
      key :format, :object
      key :required, [:type, :attributes, :relationships]

      property :type do
        key :type, :string
      end

      property :id do
        key :type, :integer
      end

      property :attributes do
        key :format, :object
        key :required, [:title, :content]

        property :title do
          key :type, :string
        end

        property :content do
          key :type, :string
        end
      end

      property :relationships do
        key :format, :object
        key :required, [:user, :article]
        property :user do
          key :format, :object
          key :required, [:data]
          property :data do
            key :format, :object
            key :required, [:type, :id]
            property :type do
              key :type, :string
            end
            property :id do
              key :type, :integer
            end
          end
        end
        property :article do
          key :format, :object
          key :required, [:data]
          property :data do
            key :format, :object
            key :required, [:type, :id]
            property :type do
              key :type, :string
            end
            property :id do
              key :type, :integer
            end
          end
        end

      end

    end
  end
end
