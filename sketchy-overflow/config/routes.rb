SketchyOverflow::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :questions, except: [:edit, :update, :destroy]
  resources :answers, only: [:create]
  root to: 'questions#index'
end
