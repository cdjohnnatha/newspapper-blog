# frozen_string_literal: true

module Api::V1
  class ApiController < ApplicationController
    include JSONAPI::ActsAsResourceController

    before_action :authenticate_user!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    private
      def context
        {user: current_user}
      end

      def user_not_authorized
        head :forbidden
      end
  end
end
