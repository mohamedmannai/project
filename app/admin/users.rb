ActiveAdmin.register User do
        index do
          column :first_name
          column :last_name
          column :username
          column :email
          column "Actions" do |user|
            link_to 'View', admin_user_path(user)
         end
      end
          actions :all, except: [:update, :new, :edit]
 end
