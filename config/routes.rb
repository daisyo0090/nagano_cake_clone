Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  
  namespace :admin do
    resources :items,:customers,:genres
    devise_for :admins
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
