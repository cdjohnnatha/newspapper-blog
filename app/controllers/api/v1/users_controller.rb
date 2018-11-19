# frozen_string_literal: true

module Api::V1
  class UsersController < ApiController
    skip_before_action :authenticate_user!, only: [:create]
  end
end
