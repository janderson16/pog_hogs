class HomeController < ApplicationController
  def home
    @category_1 = Category.find_by(title: "Slammers")
    @category_2 = Category.find_by(title: "Sets")
    @category_3 = Category.find_by(title: "Boards")
    @item_1 = Item.find_by(title: "OJ Slammer")
    @item_2 = Item.find_by(title: "NFL Team Pog Set")
    @item_3 = Item.find_by(title: "Pog Game Board")
    render :home
  end
end
