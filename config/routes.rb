Rails.application.routes.draw do

  namespace :admin do
      resources :items,:customers,:genres
  end
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations',
  }
  devise_for :customers
  root to: 'homes#top'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
