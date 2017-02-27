class HomeController < ApplicationController
  def home
    @items = Item.all
    render :home
  end
end
