class Paynows::CreatePaynow
  include Virtus.model

  attribute :product, Product
  attribute :params, Hash
  attribute :user, User

  attribute :paynow, Paynow
  # It's recommended that your service classes have a single
  # public instance method that performs that action of this
  # class
  def call
    @paynow          = Paynow.new params
    @paynow.user     = user
    @paynow.product = product
    if @paynow.save
      # PaynowsMailer.notify_product_owner(@paynow).deliver_now
      true
    else
      false
    end
  end

end
