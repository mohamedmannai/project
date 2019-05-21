ActiveAdmin.register User do
  config.filters = false
        index do
          column :first_name
          column :last_name
          column :username
          column :email
          column "Avatar", :avatar do |obj|
      image_tag(obj.avatar.url(:thumb))
    end
          column "Actions" do |user|
            link_to 'View', admin_user_path(user)
         end
      end
      show do |b|
     attributes_table do
        row :id
        row :first_name
        row :last_name
        row :email
        row :birthday_on
        row :username
        row :phone_number
        row :gender
       row :avatar do
         image_tag(b.avatar.url(:medium))
       end
     end
   end
          actions :all, except: [:update, :new, :edit]
 end
