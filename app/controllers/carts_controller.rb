class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.contents[item.id.to_s], item.title)}."
    redirect_back(fallback_location: items_path)
  end

  def show
    @cart_items = @cart.cart_items
  end

  def update
    @cart.contents[params[:id]] = params[:update].to_i
    redirect_to cart_path
  end

  def destroy
    byebug
    item = Item.find(params[:id])
    byebug
    @cart.contents[params[:id]] = nil
    flash[:notice] = "You now have #{pluralize(@cart.contents[item.id.to_s], item.title)}."
    redirect_to cart_path
  end

end
