Rails.application.routes.draw do
  get 'reviews/new'
  root 'restaurants#index'
  resources :restaurants, only: %i[index show new create] do
    resources :reviews, only: %i[new create]
  end
end
