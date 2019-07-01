Rails.application.routes.draw do
  resources :services, only: [:new, :index, :create, :show]

  namespace :admin do
    root to: "services#index"
    resources :services, only: [:index, :edit, :update, :destroy]
  end

  root :to => "home#index"
end
