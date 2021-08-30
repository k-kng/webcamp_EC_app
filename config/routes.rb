Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
   resources :genres, only:[:index, :create, :edit, :update]
   resources :items
 end
  devise_for :customers
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
