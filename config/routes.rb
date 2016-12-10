Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  get 'profile', to: 'users#show'
  get 'stats', to: 'pages#stats'

  scope '(:locale)', locale: /fr|en/ do
    get 'attendances', to: 'attendances#index'
    resources :memberships, except: [:create, :destroy]
    resources :users, only: [:new, :show, :index, :edit]
    resources :trainings do
      get ':id/new_teacher',           to: 'trainings#new_teacher'
      get 'new_board_member',      to: 'trainings#new_board_member'
      get 'destroy_teacher',       to: 'trainings#destroy_teacher'
      get 'destroy_board_member',  to: 'trainings#destroy_board_member'
      # resources :teachers,      only: [:new, :destroy]
      # resources :board_members, only: [:new, :destroy]
      resources :attendances, only: [:show, :new, :index, :edit, :destroy]
    end
  end

end

    # member do
    #   get 'pick_teacher',                 to: 'trainings#pick_teacher'
    #   get 'remove_teacher',               to: 'trainings#remove_teacher'
    #   get 'pick_board_member',            to: 'trainings#pick_board_member'
    #   get 'remove_board_member',          to: 'trainings#remove_board_member'

    # end
    #resources :attendances, only: [:show, :new, :index, :edit]
      #get 'training_id:/attendances/new', to: 'attendances#new'
