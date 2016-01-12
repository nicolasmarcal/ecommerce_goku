Rails.application.routes.draw do
  root to: "admin/admin#index"
  namespace :admin do
    devise_for :users, controllers: {
        sessions: 'admin/sessions'
      }
    resources :addresses do
      collection do
        get :find_external_address
      end
    end
  end
end
