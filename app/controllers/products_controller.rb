class ProductsController < ApplicationController
  before_action :find_product, only: [:show,:edit,:update]
  # if rspec hide authenticate_user
  before_action :authenticate_user!, only: [:index,:show,:edit,:update]

  #need separate user and admin_user
  # before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    1.times {@product.attachments.build}
  end

  def create
    @product       = Product.new(product_params)
    @product.user  = current_user

    if @product.save
      redirect_to product_path(@product), notice: "Product Created"
    else
      flash[:alert] = get_errors
      render :new
    end

  end

  def show
    @review  = Review.new
    @favourite = @product.favourite_for(current_user)
    # respond_to do |format|
    #   format.html {render}
    #   format.json {render json: @product.to_json}
    # end
  end

  def edit
    redirect_to root_path, alert: "access denied" unless can? :edit, @product
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product Updated"
    else
      render :edit
    end
  end

  private

  def find_product
    @product = Product.find params[:id]
    # @product = Product.friendly.find params[:id]
  end

  def product_params

    params.require(:product).permit([:title, :description, :price, :sku, :quantity,:category_id,:producer_id,:image])
      # , {attachments_attributes:[:image, :image_id,:_destroy]}])

   end

   def get_errors
   @product.errors.full_messages.join('; ')
   end
end
