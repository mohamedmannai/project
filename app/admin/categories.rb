ActiveAdmin.register Category do
   permit_params :label, :categorytype_id
   index do
     column :id
     column :label
     column :categorytype_id
   end
end
