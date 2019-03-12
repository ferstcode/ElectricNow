Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :show, as: 'user_profile'

  resources :electrics do 
    resources :qualifications
  end

  resources :detections do 
    resources :quatations
  end 
 
  get "landings/index"

  root "landings#index"
end
