Rails.application.routes.draw do
  devise_for :users
  root to: "cats#index"
  resources :cats, only: %i[index] do
    member do
      get 'new', to: 'reservations#new'
      post '/', to: 'reservations#create'
    end
  end
end
