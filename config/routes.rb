KioskServer::Application.routes.draw do
  root :to => "home#index"
  devise_for :users

  get "/:cpu_id" => "home#kiosk"
end
