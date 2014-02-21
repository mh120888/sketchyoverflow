SketchyOverflow::Application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :users
  resources :questions, except: [:edit, :update, :destroy]
  root to: 'questions#index'
end
