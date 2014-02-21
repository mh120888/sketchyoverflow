SketchyOverflow::Application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :user
end
