class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  def initialize_session
    session[:shopping_cart] ||= [] #empty array representind product id's
  end

  def cart
    Product.find(session[:shopping_cart])
  end
end
