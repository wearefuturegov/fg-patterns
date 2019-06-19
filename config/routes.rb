Rails.application.routes.draw do
  resources :patterns, only: [:index, :show]
  resources :services, only: [:new, :create, :edit, :show]

  root :to => "home#index"
end
