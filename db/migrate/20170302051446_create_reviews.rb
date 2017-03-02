class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :author_name
      t.text :body
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
