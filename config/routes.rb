Rails.application.routes.draw do
 devise_for :admin, controllers: {
  sessions:      'admin/sessions/sessions',
  passwords:     'admin/sessions/passwords',
  registrations: 'admin/sessions/registrations'
}
 namespace :admin do
   resources :genres, only:[:index, :create, :edit, :update]
   resources :items, only:[:show, :index, :new, :create, :edit, :update]
   resources :customers, only:[:index, :show, :edit, :update]
   get "" => "homes#top"
   resources :orders, only:[:show, :update]
 end

 devise_for :customers, controllers: {
  sessions:      'public/customers/sessions',
  passwords:     'public/customers/passwords',
  registrations: 'public/customers/registrations'
}

 scope module: :public do
  resources :customers, only:[:show, :edit, :update] do
   collection do
    get 'check'
    patch 'withdrawal'
   end
  end
  resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]
  resources :items, only:[:index, :show]
  resources :cart_items, only:[:index, :update, :create, :destroy] do
   collection do
    delete 'all_destroy'
   end
  end
  resources :orders, only:[:new, :index, :show, :create] do
   collection do
    post 'confirm'
    get 'thanks'
   end
  end
 end

 root to: 'public/homes#top'
 get 'about' => 'public/homes#about'
end
