class AddCategorytypeToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :categorytype, foreign_key: true
  end
end
