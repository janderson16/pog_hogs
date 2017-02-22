class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price, default: 0.0
      t.string :description
      t.string :image_path

      t.timestamps
    end
  end
end
