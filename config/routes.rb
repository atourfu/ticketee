Rails.application.routes.draw do
  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions

      put "permissions", to: "permissions#set",
                          as: "set_permissions"
    end
    resources :states do
      member do
        get :make_default
      end
    end
  end

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  
  root "projects#index"

  resources :projects do
  	resources :tickets do
      collection do
        get :search
      end
    end
  end

  resources :tickets do
    resources :comments
    resources :tags do
      member do
        delete :remove
      end
    end
  end

  resources :users
  resources :files
end
