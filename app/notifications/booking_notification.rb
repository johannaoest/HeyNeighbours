# To deliver this notification:

# notification.deliver(@booking.user)
#
# BookingNotification.with(post: @post).deliver_later(current_user)
# BookingNotification.with(job: @job).deliver(current_user)

class BookingNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end
  # Add required params
  #
  param :job

  # Define helper methods to make rendering easier.
  #
  def message
    job = Job.find(params[:job])
    if job.present?
      "You have a new application on this job: #{job.title}!"
    else
      "You have a new application"
    end
  end

  def url
    applyments_index_path(params[:job])
  end
end
