Rails.application.routes.draw do
  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions

      put "permissions", to: "permissions#set",
                          as: "set_permissions"
    end
  end

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  
  root "projects#index"

  resources :projects do
  	resources :tickets
  end

  resources :users
  resources :files
end
