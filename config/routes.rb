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
      member do
        get 'pick_teacher',                         to: 'trainings#pick_teacher'
        get 'remove_teacher/:teacher_id',           to: 'trainings#remove_teacher'
        get 'pick_board_member',                    to: 'trainings#pick_board_member'
        get 'remove_board_member/:board_member_id', to: 'trainings#remove_board_member'
        get 'training_id:/attendances/new',         to: 'attendances#new'
      end
    resources :attendances, only: [:show, :new, :index, :edit]
    end
  end
end
