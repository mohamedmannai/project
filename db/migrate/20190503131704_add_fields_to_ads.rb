class AddFieldsToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :publishing_at, :datetime
    add_column :ads, :validation_at, :datetime
  end
end
