# Stripe.api_key = Rails.application.credentials[:stripe_secret] 
Stripe.api_key = ENV["stripe_secret"]