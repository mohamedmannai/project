ActiveAdmin.register Ad do
  scope:all
  scope:published
  scope:unpublished
  config.filters = false
  index do
    column :id
    column :title
    column :description
    column :price
    column :publishing_at
    column :user_id
    column :category_id
    column "Actions" do |ad|
      link_to 'View', admin_ad_path(ad)
    end
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :price
      row :publishing_at
      row :category_id
      row :user_id
      ad.images.each do |image|
        row :image do |ad|
          image_tag( image )
        end
      end
    end
  end

  actions :all, except: [:update, :new, :edit]
  action_item :publish, only: :show do
    link_to "Publish", publish_admin_ad_path(ad), method: :put if !ad.publishing_at?
  end

  action_item :unpublish, only: :show do
    link_to "Unpublish", unpublish_admin_ad_path(ad), method: :put if ad.publishing_at?
  end

  member_action :publish, method: :put do
    ad = Ad.find(params[:id])
    ad.update(publishing_at: Time.zone.now)
    ad.update(validation_at: Time.zone.now)
    redirect_to admin_ad_path(ad)
  end

  member_action :unpublish, method: :put do
    ad = Ad.find(params[:id])
    ad.update(publishing_at: nil)
    ad.update(validation_at: nil)
    redirect_to admin_ad_path(ad)
  end
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
