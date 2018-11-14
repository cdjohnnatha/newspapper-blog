# frozen_string_literal: true

Rails.application.routes.draw do
  post "user_token" => "user_token#create"
  scope module: :api do
    scope "(:locale)", locale: /en|nl/ do
      namespace "v1" do
        resources :docs, only: [:index]

        jsonapi_resources :users do
          jsonapi_resources :articles
        end
      end
    end
  end
end
