class ItemsController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
    @cart = Cart.new(session[:cart])
  end
end
