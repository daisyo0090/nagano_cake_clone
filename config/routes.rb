Rails.application.routes.draw do

  namespace :admin do
      resources :items,:customers,:genres
  end

  namespace :public do
    resources :customers,:items
  end

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations',
  }
  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations',
  }
  get "/about" => "public/homes#about"
  root to: 'public/homes#top'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
