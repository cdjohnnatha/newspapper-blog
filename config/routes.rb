# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :api do
    scope "(:locale)", locale: /en|nl/ do
      namespace "v1" do
        resources :docs, only: [:index]
        mount_devise_token_auth_for 'User', at: 'auth'
        post "user_token" => "user_token#create"

        jsonapi_resources :users, except: [:index] do
          jsonapi_resources :articles
        end

        jsonapi_resources :articles, only: [:index, :show] do
          jsonapi_resources :comments, except: [:show]
        end
      end
    end
  end
end
