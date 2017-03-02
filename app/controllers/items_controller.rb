class ItemsController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @review.item_id = @item.id
  end

end
