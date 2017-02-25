class AddPicToItems < ActiveRecord::Migration[5.0]
  def change
    add_attachment :items, :pic
  end
end
