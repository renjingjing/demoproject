class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    product           = Product.find params[:product_id]
    # product           = Product.friendly.find params[:product_id]
    favourite          = current_user.favourites.new
    favourite.product = product
    if favourite.save
      redirect_to product, notice: "Product favourited"
    else
      redirect_to product, alert: "Can't favourite"
    end
  end

  def destroy
    product  = Product.find params[:product_id]
    # product  = Product.friendly.find params[:product_id]
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to product, notice: "Un-Favourited"
  end

end
