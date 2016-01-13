Rails.application.routes.draw do
  root to: "admin/admin#index"
  namespace :admin do
    devise_for :users, controllers: {
        sessions: 'admin/sessions'
      }
    resources :users
    resources :addresses do
      collection do
        get :find_external_address
      end
    end
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :addresses, :only => [:index]
    end
  end
end
