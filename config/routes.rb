Rails.application.routes.draw do
  get 'ads/index'
  devise_for :users
  get 'welcome/index'
  get 'about', action: :about, controller: 'welcome'
  get 'contact', action: :contact, controller: 'welcome'
  root 'welcome#index'

 resources:ads
end
