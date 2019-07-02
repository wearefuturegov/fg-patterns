Rails.application.routes.draw do
  resources :services, only: [:new, :index, :create, :show]

  resources :patterns, only: [], param: :slug, path: '/', controller: 'services' do
    member do
      get :filter_by, to: 'services#index', path: '/'
    end
  end

  namespace :admin do
    root to: "services#index"
    resources :services, only: [:index, :edit, :update, :destroy]
  end

  root :to => "home#index"
end
