Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users, only: :show, as: 'user_profile' 
  resources :users, only: :index, as: 'electrics' 

  get :quatations, to: 'quatations#electric_quatations', as: 'user_quatations'
  
  resources :electrics do
    member do
      get 'new_detection', to: 'detections#new', as: 'nested_detection'
      get 'detections', to: 'detections#own'
    end
    resources :qualifications
  end
  resources :quatations, only: [] do
    # member do
    resources :messages
    # end 
  end
  
  resources :detections do 
    member do
      patch 'accepted_detection', to: 'detections#accepted'
      patch 'rejected_detection', to: 'detections#rejected'
    end
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
