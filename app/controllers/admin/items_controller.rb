class Admin::ItemsController < Admin::BaseController

  def index
    @categories = Category.all
  end

end
