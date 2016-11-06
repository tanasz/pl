Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  get 'profile', to: 'users#show'
  get 'stats', to: 'pages#stats'

  scope '(:locale)', locale: /fr|en/ do
    resources :memberships, except: [:create, :destroy]
    resources :users, only: [:new, :show, :index, :edit]
    resources :trainings do
      resources :attendances, only: [:show, :new, :index, :edit]
      member do
        get 'new_teacher',      to: 'attendances#new_teacher'
        get 'new_board_member', to: 'attendances#new_board_member'
        get 'training_id:/attendances/new', to: 'attendances#new'
      end
    end
  end
end
