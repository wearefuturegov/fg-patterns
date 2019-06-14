Rails.application.routes.draw do
  resources :patterns, only: [:index, :show]
end
