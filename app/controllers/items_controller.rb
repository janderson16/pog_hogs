class ItemsController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    # @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
  end

end
