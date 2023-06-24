Rails.application.routes.draw do
  devise_for :users
  root to: 'trainings#index'
  get '/training/new', to: 'trainings#new'

  resources :trainings
  resources :calories
  resources :users

end
