# frozen_string_literal: true

Rails.application.routes.draw do

  scope module: :api do
    mount_devise_token_auth_for "User", at: "auth"
    scope "(:locale)", locale: /en|nl/ do
      namespace :v1 do
        resources :docs, only: [:index]

        jsonapi_resources :users
        jsonapi_resources :articles do
          jsonapi_related_resources :comments
        end
        jsonapi_resources :comments, except: [:show, :index] do
        end
      end
    end
  end
end
