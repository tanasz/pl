Rails.application.routes.draw do
  get 'trainings/index'

  get 'trainings/create'

  get 'trainings/new'

  get 'trainings/destroy'

  get 'trainings/update'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  get 'profile', to: 'users#show'
  get 'stats', to: 'pages#stats'
  scope '(:locale)', locale: /fr|en/ do
    resources :memberships
    resources :users, except: [:show]
    resources :trainings do
      resources :attendances, only: [:show, :create]
    end
  end
end
