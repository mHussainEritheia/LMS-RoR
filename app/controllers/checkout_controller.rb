class CheckoutController < ApplicationController
    def create
        item = BookFine.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                amount: item.amount.to_i,
                name: Book.find(item.book_id).name,
                currency: "usd",
                quantity: 1
            }],
            mode: 'payment',
            success_url: reader_bookfines_url,
            cancel_url: reader_bookfines_url,
        })
        BookFine.update(paid: true)
        respond_to do |format|
            format.js
        end
    end
end