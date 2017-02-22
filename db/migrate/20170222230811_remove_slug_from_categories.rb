class RemoveSlugFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :slug
  end
end
