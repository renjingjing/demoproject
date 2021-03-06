class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show,:edit,:update]
  def new
    @carts = Cart.find params[:id]
  end


  def create

    @cart       = Cart.new(cart_params)
    @product.user  = current_user

    # the product.save will return true if it passes validations and saves
    # correctly to the database. Otherwise, it will return false.
    if @product.save
      # redirect_to sends a response back to the browser with a new url so the
      # browser can make a new GET request to that URL
      # redirect_to(product_path(id: @product.id))
      redirect_to product_path(@product), notice: "Product Created"
    else
      # @product.attachments.build
      # attachment_count = 5 - @product.attachments.length
      # attachment_count.times {@product.attachments.build}
      # this will render "new.html.erb" inside of "/views/products/" folder
      render :new
    end

    # this is just to show on the page the params we get from the user
    # for testing purposes
    # render text: params[:product]
  end

  # you access this action by visiting /products/:id
  # where :id is the id of the product we'd like to display
  def show
    # if request.path !=product_path(@product)
    #   return redirect_to @product, :status => :moved_permanently
    # end

    # instantiating an empty answer object to help us build the answer form    @answer = Answer.new

    # @comment = Comment.new
    @review  = Review.new
    # this is the like object for the @product with current_user
    # so if the user has liked this product the `@like` object will exist
    # otherwise the @like object will be nil
    @favourite = @product.favourite_for(current_user)
  end

  # this is used to render a page that will edit an existing record in
  # the database. The URL for it will be /products/:id/edit
  def edit
    redirect_to root_path, alert: "access denied" unless can? :edit, @product
  end

  def update
    # redirect_to root_path, alert: "access denied" unless can? :edit, @product
    # if the record updates successfully we redirect the user to the
    # product show page.
    #  @product.slug = nil
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product Updated"
    else
      # we render the edit page again with errors if the user doesn't enter
      # values that pass validations
      render :edit
    end
  end

  private

  def find_product
    # using .frienly will make it find the product by
    # its slug instead of by its id
    @product = Product.find params[:id]
    # @product = Product.friendly.find params[:id]
  end

  def product_params
    # params[:product] => {"title"=>"My first product", "body"=>"My first product body"}

    # This uses Strong Paramters feature of Rails where you must explicit by
    # default about what parameters you'd like to allow for your record
    # in this case we only want the user to enter teh title and the body
    params.require(:product).permit([:title, :description, :price, :sku, :quantity,:category_id,:producer_id,
                                      {attachments_attributes:[:image, :image_id,:_destroy]}])

   end
  # :category_id,:producer_id ,:id,
end
