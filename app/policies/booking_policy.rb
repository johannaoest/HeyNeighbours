class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Job.where(user: user)
      scope.all
    end
  end

  def create?
    user != record.job.user
  end

  def show?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user == record.job.user || user.admin
  end

  def create_confirmation?
    user == record.job.user || user.admin
  end

  def check_confirmation?
    true
  end

  def confirm?
    true
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
