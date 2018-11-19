# frozen_string_literal: true

require "dotenv/load"

module Api::V1
  class DocsController < ApiController
    skip_before_action :authenticate_user!
    skip_before_action :ensure_correct_media_type
    skip_before_action :ensure_valid_accept_media_type
    include Swagger::Blocks

    swagger_root do
      key :swagger, "2.0"
      info do
        key :version, "1.0.0"
        key :title, "Swagger Docs Newspapper-blog api"
        key :description, "Documentation for Newspapper-blog api "
        key :termsOfService, "http://helloreverb.com/terms/"
        contact do
          key :name, "Newspapper-blog api"
        end
        license do
          key :name, "MIT"
        end
      end
      tag do
        key :name, "Newspapper-blog api"
        key :description, "Newspapper-blog api operations"
      end
      key :host, ENV["DOCS_HOST"]
      key :basePath, "/"
      key :consumes, ["application/vnd.api+json"]
      key :produces, ["application/vnd.api+json"]

      security_definition :uid, type: :apiKey do
        key :name, :uid
        key :in, :header
      end
      security_definition :tokenType, type: :apiKey do
        key :name, "token-type"
        key :in, :header
      end
      security_definition :accessToken, type: :apiKey do
        key :name, "access-token"
        key :in, :header
      end
      security_definition :client, type: :apiKey do
        key :name, :client
        key :in, :header
      end
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      Docs::Authentication,
      Docs::V1::AuthenticationController,
      Docs::User,
      Docs::V1::UsersController,
      Docs::Article,
      Docs::V1::ArticlesController,
      Docs::Comment,
      Docs::V1::CommentsController,
      self,
    ].freeze

    def index
      swagger_data = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      File.open("#{Rails.root}/public/swagger.json", "wb") { |file| file.write(swagger_data.to_json) }
      redirect_to "/api-docs.html?url=swagger.json"
    end
  end
end
