class Item < ApplicationRecord
  belongs_to :category

  def find_item(id)
    Item.find(id)
  end
end
