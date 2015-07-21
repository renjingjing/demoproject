class PaymentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_paynow

  def new
    @paynow = Paynow.find params[:paynow_id]
  end

  def create
    @paynow = Paynow.find params[:paynow_id]
    # @product = Product.find params[:product_id]
    # @paynow = Paynow.new
    # @paynow.product = @product
    # @paynow.amount  = @product.price
    # @paynow.user    = current_user
  # if @paynow.save
  #    redirect_to new_paynow_payment_path(@paynow), notice: "Please make the payment"
  # else
  #   @error_message = "Sorry! Something went wrong. Try again."
  # end
    stripe_customer = Stripe::Customer.create(
                         description: "Customer for #{current_user.email}",
                         source:      params[:stripe_token]
                       )
     current_user.stripe_customer_token  = stripe_customer.id
    #  here my change depend on  our self message of stripe if somthing wrong we need change them
     current_user.stripe_last_4          = stripe_customer.sources.data.first.last4
     current_user.stripe_card_type       = stripe_customer.sources.data.first.brand
     current_user.save

     stripe_charge = Stripe::Charge.create(
                                 amount:       @paynow.amount.to_i * 100,
                                 currency:     "cad",
                                 customer:     current_user.stripe_customer_token,
                                 description: "Paynow for #{@paynow.product.title}"
                               )
     @paynow.stripe_txn_id = stripe_charge.id
     @paynow.payed
     @paynow.save
     PaymentMailer.payment_notification_to_buyer(@paynow).deliver_now

     redirect_to @paynow.product, notice: "Thanks for making the payment"
   end
 end
