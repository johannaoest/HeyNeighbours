class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user

    if current_user == @booking.job.user
      @review.reviewed_user = @booking.user

    else
      @review.reviewed_user = @booking.job.user
    end

    authorize @review
    if @review.save
      if current_user == @booking.job.user
        @booking.update(employee_rated: true)
      else
        @booking.update(employer_rated: true)
      end
      redirect_to users_show_path(@review.reviewed_user)
    else
      render "jobs/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
