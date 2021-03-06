Rails.application.routes.draw do

  namespace :admin do
      resources :items,:customers,:genres
      root to: 'homes#top'
  end

  scope module: :public do
    get "/orders/thanks" => "orders#thanks"
    post "/customers/seeyou" => "customers#seeyou"
    devise_for :customers, controllers: {
      sessions:      'public/customers/sessions',
      passwords:     'public/customers/passwords',
      registrations: 'public/customers/registrations',
    }
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :items,:addresses,:cart_items,:orders
    resource :customers, path: "customers/my_page"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    post "/orders/check" => "orders#check"

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
