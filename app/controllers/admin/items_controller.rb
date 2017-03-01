class Admin::ItemsController < Admin::BaseController
  
  def index
    @items = Item.all
  end

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

  def edit
    @categories = Category.all
    @item = Item.find(params[:id])
    @statuses = Item.statuses
  end

  def update
    category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "Item successfully updated!"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = "Your item did not save!"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :image_path, :status, :category_id)
  end
  
end
