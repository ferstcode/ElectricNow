Rails.application.routes.draw do
  devise_for :users 
  
  get "users/:id", action: :show, controller: :users

  resources :detections do 
    resources :quatations
  end 
 

  get "landings/index"

  root "landings#index"
end
