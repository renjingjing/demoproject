class PaynowsController < ApplicationController
  before_action :authenticate_user!

def create
    @product = Product.find params[:product_id]
    @paynow = Paynow.new
    @paynow.product = @product
    @paynow.amount  = @product.price
    @paynow.user    = current_user
  if @paynow.save
       redirect_to new_paynow_payment_path(@paynow), notice: "Please make the payment"
  else
    @error_message = "Sorry! Something went wrong. Try again."
    render "/product/show"
  end
end

  private
  def get_errors
  @paynow.errors.full_messages.join(';')
  end
end
