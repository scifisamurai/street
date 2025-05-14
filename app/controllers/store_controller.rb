class StoreController < ApplicationController
  def index
    increment_session_counter
    @products = Product.order(:title)
  end

  private

  def increment_session_counter
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
  end
end
