class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = policy_scope(current_user.notifications).newest_first
    current_user.notifications.mark_as_read!
  end
end
