Rails.application.routes.draw do
 devise_for :admins, controllers: {
  sessions:      'admin/sessions/sessions',
  passwords:     'admin/sessions/passwords',
  registrations: 'admin/sessions/registrations'
}
 namespace :admin do
   resources :genres, only:[:index, :create, :edit, :update]
   resources :items
   resources :customers, only:[:index, :show, :edit, :update]
   get "" => "homes#top"
   resources :oders, only:[:show, :update]
 end

 devise_for :customers, controllers: {
  sessions:      'public/customers/sessions',
  passwords:     'public/customers/passwords',
  registrations: 'public/customers/registrations'
}
 root to: 'public/homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
