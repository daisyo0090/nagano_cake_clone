Rails.application.routes.draw do

  namespace :admin do
      resources :items,:customers,:genres
      root to: 'homes#top'
  end

  scope module: :public do
    devise_for :customers, controllers: {
      sessions:      'public/customers/sessions',
      passwords:     'public/customers/passwords',
      registrations: 'public/customers/registrations',
    }
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :items,:addresses,:cart_items,:orders
    resource :customers, path: "customers/my_page"
    get "/customers_unsubscribe" => "customers#unsubscribe"
    post "/orders_check" => "orders#check"
    get "/orders_thanks" => "orders#thanks"

  end

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations',
  }

  get "/about" => "public/homes#about"
  root to: 'public/homes#top'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
