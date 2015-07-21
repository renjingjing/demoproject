class Payment::PaynowWithStripe

  include Virtus.model

  attribute :paynow, Paynow
  attribute :user, User

  attribute :error_messages, Array

  def call
    charge_user
  end

  private

  def charge_user
    begin
      # charge the customer
      Stripe::Charge.create(
        amount: (paynow.amount * 100).to_i,
        currency: 'cad',
        customer: user.stripe_customer_token,
        description: "Payment for product: #{paynow.product.title}"
      )
    rescue => e
      @error_messages << e.message
      false
    end
  end

end
