Rails.application.routes.draw do
  devise_for :users
  root to: "cats#index"
  resources :cats, only: %i[index show new create] do
    resources :reservations, only: %i[new]
    resources :reservations, only: %i[create], path: ''
  end
  namespace :admin do
    resources :cats, only: %i[index show]
  end
end
