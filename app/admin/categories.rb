ActiveAdmin.register Category do
   permit_params :label, :categorytype_id
  config.filters = false
end
