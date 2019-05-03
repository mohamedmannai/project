class AddFieldsToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :publishing_at, :datetime
  end
end
