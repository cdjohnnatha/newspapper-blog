# frozen_string_literal: true

module Api::V1
  class ArticlesController < ApiController
    skip_before_action :authenticate_user!, only: [:index, :show]
  end
end
