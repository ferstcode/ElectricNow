Rails.application.routes.draw do
  devise_for :users 
  

  resources :detections do 
    resources :quatations
  end 
 

  get "landings/index"

  root "landings#index"
end
