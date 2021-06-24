class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = policy_scope(current_user.notifications).order(created_at: :desc)
  end
end
