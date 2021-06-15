class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Job.where(user: user)
      scope.all
    end
  end

    # def new?
    #   true
    # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # if user is the owner of the job - true
  #   # otherwise it should be - false
  #   # user = current user
  #   # record = add job (argument path to authotize)
  #   user == record.user
  # end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
