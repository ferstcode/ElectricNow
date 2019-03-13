Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: :show, as: 'user_profile' 
  get :quatations, to: 'quatations#electric_quatations', as: 'user_quatations'
  
  
  resources :electrics do
    member do
      get 'new_detection', to: 'detections#new', as: 'nested_detection'
    end
    resources :qualifications
  end
  
  resources :detections do 
    resources :quatations do 
      member do
        patch 'accepted_quatation', to: 'quatations#accepted'
        patch 'rejected_quatation', to: 'quatations#rejected'
      end
    end
  end 
  
  get "landings/index"
  
  root "landings#index"
end
