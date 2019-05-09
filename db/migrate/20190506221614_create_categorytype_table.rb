class CreateCategorytypeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :categorytype_tables do |t|
      t.string :label
    end
  end
end
