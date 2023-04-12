class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    #session[:shopping_cart] << id # pushes id onto the end of the array
    product = Product.find(id)

    if session[:shopping_cart].include?(id) # pushes id onto the end of the array
      flash[:notice] = "✚ #{product.name} is already in the cart."
    elsif session[:shopping_cart] << id
      flash[:notice] = "✚ #{product.name} added to cart."
    end

    redirect_to cart_index_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "✚ #{product.name} removed from cart."
    redirect_to cart_index_path
  end
end
