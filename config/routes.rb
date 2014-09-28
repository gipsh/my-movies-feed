AtvFe::Application.routes.draw do
  get "film/show"

  get "film/add"
  get "film/remove"

  resources :feed

  devise_for :users
  resources :movieupdater
  resources :film

  resources :users do
    resources :films
  end
  
  root :to => "home#index"


end
