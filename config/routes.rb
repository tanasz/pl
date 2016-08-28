Rails.application.routes.draw do
  # get 'attendances/create
  # get 'sessions/index
  # get 'sessions/create
  # get 'sessions/new
  # get 'sessions/edit
  # get 'sessions/show
  # get 'sessions/update
  # get 'sessions/destroy
  # get 'memberships/index
  # get 'memberships/create
  # get 'memberships/new
  # get 'memberships/edit
  # get 'memberships/show
  # get 'memberships/update
  # get 'memberships/destroy
  # get 'users/index
  # get 'users/create
  # get 'users/new
  # get 'users/edit
  # get 'users/show
  # get 'users/update
  # get 'users/destroy'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'profile', to: 'users#show'
  root to: 'pages#home'
  resources :memberships
  resources :users, except: [:show]
  resources :sessions do
    resources :attendances, only: [:show, :create], shallow: true
  end
end
