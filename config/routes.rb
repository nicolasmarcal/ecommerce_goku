Rails.application.routes.draw do
  namespace :admin do
    devise_for :users
    resources :admin, only: [:index]
  end
end
