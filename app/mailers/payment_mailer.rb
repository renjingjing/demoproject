class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  default from: "from@example.com"

  def payment_notification_to_buyer(paynow)
    @greeting = "#{paynow.user.full_name}"
    mail to: paynow.user.email, subject: "Your payment for #{paynow.product.title}, sku: #{paynow.product.sku}, price: #{paynow.amount} is already accepted. Thank for your purchasing! Art Gallery"
  end


end
