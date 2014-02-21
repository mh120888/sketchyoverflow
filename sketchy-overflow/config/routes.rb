SketchyOverflow::Application.routes.draw do

  resources :questions, except: [:edit, :update, :destroy]

  root to: 'questions#index'
end
