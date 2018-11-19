# frozen_string_literal: true

module Api::V1
  class CommentsController < ApiController
    skip_before_action :authenticate_user!, only: [:get_related_resources]
  end
end
