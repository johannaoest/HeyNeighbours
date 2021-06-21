class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Job.where(user: user)
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    user == record.sender || user == record.recipient
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.sender || user == record.recipient || user.admin
  end
end
