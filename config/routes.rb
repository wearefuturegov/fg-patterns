Rails.application.routes.draw do
  resources :services, only: [:new, :index, :create, :show]

  #get '/check', to: 'services#show', id: 1

  resources :patterns, only: :show, param: :slug, path: '/'

  namespace :admin do
    root to: "services#index"
    resources :services, only: [:index, :edit, :update, :destroy]
  end

  root :to => "home#index"
end
