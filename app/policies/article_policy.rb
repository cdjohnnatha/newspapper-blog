# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user_present?
  end

  def show?
    true
  end

  def update?
    user_present? && is_owner?
  end

  def delete?
    user_present? && is_owner?
  end

  private
    def user_present?
      true if user.present?
    end

    def is_owner?
      true if user == record.user
    end
end
