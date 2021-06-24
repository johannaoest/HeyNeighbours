class OrdersController < ApplicationController
  def create
    booking =Booking.find(params[:booking_id])
    booking.update(confirmed: true, pending: false)
    order = Order.create!(booking: booking, amount: booking.job.price, state: 'pending', user: current_user)

    authorize order
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: booking.job.title,
        images: [booking.job.photo.service_url],
        amount: booking.job.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
  @order = current_user.orders.find(params[:id])
  authorize @order
  end
end
