Stripe.api_key             = ENV['STRIPE_SECRET_KEY']     
StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET'] 

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', Stripe::EventHandler.new
end 
