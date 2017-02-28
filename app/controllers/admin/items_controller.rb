class Admin::ItemsController < Admin::BaseController

  def new
    @categories = Category.all
    @item = Item.new
    @statuses = Item.statuses
  end

  def create
    category = Category.find(params[:category_id])
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Item successfully created!"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = "Your item did not save!"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :image_path, :status, :category_id)
  end
end
