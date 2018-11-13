# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :api do
    scope "(:locale)", locale: /en|nl/ do
      namespace "v1" do
        jsonapi_resources :users
      end
    end
  end
end
