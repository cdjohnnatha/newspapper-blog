# frozen_string_literal: true

class Docs::Article
  include Swagger::Blocks

  swagger_schema :Article do
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

      property :links do
        key :format, :object
        key :required, [:self]
        property :self do
          key :type, :string
        end
      end

      property :attributes do
        key :format, :object
        key :required, [:title, :content]

        property :id do
          key :type, :integer
        end

        property :title do
          key :type, :string
        end

        property :content do
          key :type, :string
        end
      end
      property :relationships do
        key :format, :object
        key :required, [:user, :comments]

        property :user do
          key :format, :object
          key :required, [:self, :related]

          property :self do
            key :type, :string
          end
          property :related do
            key :type, :string
          end
        end

        property :comments do
          key :format, :object
          key :required, [:self, :related]

          property :self do
            key :type, :string
          end
          property :related do
            key :type, :string
          end
        end
      end
    end
  end

  swagger_schema :ArticleInput do
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
        key :required, [:user]
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
      end
    end
  end
end
