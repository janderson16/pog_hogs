class UpdateItemPriceDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:items, :price, nil)
  end
end
