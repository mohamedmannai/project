class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :gender, :integer
    add_column :users, :birthday_on, :date
  end
end
