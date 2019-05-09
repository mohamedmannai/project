class CreateCategorytypes < ActiveRecord::Migration[5.2]
  def change
    create_table :categorytypes do |t|
      t.string :label

      t.timestamps
    end
  end
end
