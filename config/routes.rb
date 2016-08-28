Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'profile', to: 'users#show'
  root to: 'pages#home'
  scope '(:locale)', locale: /fr|en/ do
    resources :memberships
    resources :users, except: [:show]
    resources :sessions do
      resources :attendances, only: [:show, :create]
    end
  end
end
