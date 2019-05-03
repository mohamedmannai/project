class AddCategoryToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :category_id, :refrences
  end
end
