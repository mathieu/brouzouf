Brouzouf::Application.routes.draw do

  resources :bids

    
  resources :bets do
  
    member do
      post 'set_bet_open', 'set_bet_close', 'set_bet_creation'
    end

    resources :choices, :only => [:new, :create, :update, :destroy, :edit]

  end
  
  get "home/index"

  devise_for :users do
  
    #:controllers => { :sessions => 'users/sessions' } 
    get 'users', :to => 'users#index', :as => :user_root # Rails 3
    match '/users/show/:id', :to => 'users#show',    :as => :user,         :via => :get
  
  end

  root :to => "home#index"

  
end
