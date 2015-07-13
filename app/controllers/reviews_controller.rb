class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review, only: [:destroy]
  # before_action :authorize

  def create
    @product         = Product.find params[:product_id]
    review_params  = params.require(:review).permit(:body,:image)
    @review        = Review.new review_params
    @review.user   = current_user
    @review.product = @product
    respond_to do |format|
    if @review.save
      # AnswersMailer.delay.notify_question_owner(@product)
      format.html { redirect_to product_path(@product), notice: "Review created" }
      format.js   { render  } # this renders: create.js.erb
    else
      # we use the full path because if we do render :show it will look for
      # a template called show.html.erb within the /app/views/answers folder
      format.html { render "/products/show" }
      format.js   { render :create_failure } # this renders: create_failure.js.erb
    end
    end
  end

  def destroy
    @product  = Product.find params[:product_id]
    @review   = current_user.reviews.find params[:id]
    @review.destroy
    respond_to do |format|
    format.html { redirect_to product_path(product), notice: "Review deleted" }
    format.js   { render }
    end
  end

  private

  def find_review
    # using .frienly will make it find the product by
    # its slug instead of by its id
    @review = Review.find params[:id]
  end

  def authorize
    # we only allow the answer owner or the answer question's owner to delete
    # the answer
    unless can? :manage, @review
      redirect_to root_path, alert: "Access denied"
    end
  end
end
