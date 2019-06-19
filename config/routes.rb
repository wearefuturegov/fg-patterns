Rails.application.routes.draw do
  resources :patterns, only: [:index, :show]

  root :to => "home#index"
end
