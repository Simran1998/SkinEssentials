class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    category_search = "%#{params[:category]}%"
    @products = Product.where("name LIKE ?", wildcard_search).where("category_id LIKE ?", category_search)
  end

  def sale
    @products= Product.where.not(sale_price: nil).where("sale_price < price")
  end
end
