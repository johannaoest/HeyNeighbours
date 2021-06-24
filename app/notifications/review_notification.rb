# To deliver this notification:
#
# ReviewNotification.with(post: @post).deliver_later(current_user)
# ReviewNotification.with(post: @post).deliver(current_user)

class ReviewNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end
  # Add required params
  #
  param :review

  # Define helper methods to make rendering easier.
  #
  def message
    review = Review.find(params[:review])
    if review.present?
      "You have a new review on this job: #{review.booking.job.title}!"
    else
      "You have a new review"
    end
  end

  def url
    review = Review.find(params[:review])
    users_show_path(review.user)
  end
end
