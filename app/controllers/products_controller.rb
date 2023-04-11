class ProductsController < ApplicationController
  def index
    @products = Product.all

  end

  def show
    #session[:visit_count] ||= 0
    # session[:visit_count] += 1
    # @visit_count = session[:visit_count]
    @product = Product.find(params[:id])
    @category = @product.category
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    category_search = "%#{params[:category]}%"
    @products = Product.where("name LIKE ?", wildcard_search).where("category_id LIKE ?", category_search)
  end

  def sale
    @products= Product.where.not(sale_price: nil).where("sale_price < price")
  end

  def new
    @products =  Product.where("created_at >= ?", 3.days.ago)
  end
end
