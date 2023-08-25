Rails.application.routes.draw do
  root to: "cats#index"
  resources :cats, only: %i[index show new create] do
    resources :reservations, only: %i[new]
    resources :reservations, only: %i[create], path: ''
  end
  namespace :admin do
    resources :cats, only: %i[index show]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
