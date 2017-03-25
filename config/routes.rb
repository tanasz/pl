Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root           to: 'pages#home'
  get 'profile', to: 'users#show'
  get 'stats',   to: 'pages#stats'
  scope '(:locale)', locale: /fr|en/ do
    get 'attendances', to: 'attendances#index'
    resources :memberships, except: [:create, :destroy]
    resources :users, only: [:new, :show, :index, :edit]
    resources :trainings do
      get     'new_teacher',           to: 'trainings#new_teacher'
      get     'new_board_member',      to: 'trainings#new_board_member'
      delete  'teacher/:id'      => 'trainings#destroy_teacher', as: :destroy_teacher
      delete  'board_member/:id' => 'trainings#destroy_board_member', as: :destroy_board_member
      resources :attendances,   only: [:show, :new, :index, :edit, :destroy]
    end
  end

end
