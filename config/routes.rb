Rails.application.routes.draw do
  root to: "admin/admin#index"
  namespace :admin do
    devise_for :users, controllers: {
        sessions: 'admin/sessions'
      }
    resources :admin, only: [:index]
  end
end
