class CreateAdsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :location
    end
      add_index :ads, [:user_id, :created_at]
  end
end
