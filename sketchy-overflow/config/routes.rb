SketchyOverflow::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :questions, except: [:edit, :update, :destroy]
  resources :answers, only: [:create]
  resources :votes
  root to: 'questions#index'
  put 'answers/best', to: 'answers#best', as: :best_answer
end
