class RemovePublishingAtFromAds < ActiveRecord::Migration[5.2]
  def change
    remove_column :ads, :publishing_at, :datetime
  end
end
