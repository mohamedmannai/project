ActiveAdmin.register User do
        index do
          column :first_name
          column :last_name
          column :username
          column :email
      end
          actions :all, except: [:update, :new]
 end
