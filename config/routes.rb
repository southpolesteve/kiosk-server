KioskServer::Application.routes.draw do
  ActiveAdmin.routes(self)

  root :to => "home#index"
  devise_for :users, ActiveAdmin::Devise.config

  resources :kiosks, only: [:show, :update, :edit] do
    member do
      get :instructions
    end
  end

end
