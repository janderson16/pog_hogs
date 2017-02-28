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
    @cart_items = @cart.items
  end

  def update
    @cart.contents[params[:id]] = params[:update].to_i
    redirect_to cart_path
  end

  def destroy
    item = Item.find(params[:id])
    quantity = params[:id]
    cart_item = CartItem.new(item, quantity)
    @cart.contents.delete(params[:id])
    flash[:notice] = "You've successfully removed the #{view_context.link_to(cart_item.title, category_item_path(item.category, item))} from your cart."
    redirect_to cart_path
  end

end
