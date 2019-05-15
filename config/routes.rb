Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'welcome/index'
  get 'about', action: :about, controller: 'welcome'
  get 'contact', action: :contact, controller: 'welcome'
  root 'ads#index'
  get 'myads', action: :myads, controller: 'ads'

 resources:ads
 resources:categories
 resources:categorytypes
end
