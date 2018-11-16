class UserPolicy < ApplicationPolicy
  def index?
    return true if user.present?
  end

  def create?
    true
  end

  def show?
    return true if user.present?
  end

  def update?
    return true if user.present?
  end

  def destroy?
    return true if user.present?
  end

  private
    def article
      record
    end

  # class Scope < Scope
  #   def resolve
  #     scope
  #   end
  # end
end
