# frozen_string_literal: true

module Api::V1
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  end
end
