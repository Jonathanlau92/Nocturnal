class CheckoutController < ApplicationController
	def create
    # Create a stripe account for existing user (without having to register again)
    if current_user.stripe_customer_id.nil?
      current_user.stripe_customer_id = Stripe::Customer.create({email: current_user.email}).id
      current_user.save
    end
    @session = Stripe::Checkout::Session.create(
      customer: current_user.stripe_customer_id,
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
      	price: "price_1HGQMhDYdXVcBWMKZuH6i5cE",
      	quantity: 1,
      }],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
    )
    respond_to do |format|
      format.js
    end
  end

  def success
    if params[:session_id]
      flash[:notice] = "Thanks for your purchasing nocturnal pass. See you!"
      UserMailer.purchase_confirmation(current_user).deliver_later
      redirect_to root_path
    else
      flash[:error] = "Session expired error"
      redirect_to root_path
    end
  end

  # def cancel
    
  # end
end
