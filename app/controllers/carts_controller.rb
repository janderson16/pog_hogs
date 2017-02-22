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
    @cart.contents
  end

end
