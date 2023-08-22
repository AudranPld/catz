Rails.application.routes.draw do
  devise_for :users
  root to: "cats#index"
  resources :cats, only: %i[index show new create] do
    resources :reservations, only: %i[new create]
  end
  namespace :admin do
    resources :cats, :comments
  end
end
