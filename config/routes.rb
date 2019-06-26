Rails.application.routes.draw do
  resources :patterns, only: [:index, :show]
  resources :services, only: [:new, :create, :show]

  namespace :admin do
    root to: "services#index"
    resources :services, only: [:index, :edit, :update, :destroy]
  end

  root :to => "home#index"
end
