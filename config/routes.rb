Rails.application.routes.draw do
  resources :tests, only: [:index]

  root to: 'tests#index'
end
