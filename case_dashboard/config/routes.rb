CaseDashboard::Application.routes.draw do

  namespace :api do
    resources :cases, only: [:index, :update]
    resources :labels, only: [:index, :create]
  end

  get 'templates/:template' => 'templates#show'
  get '*path' => 'static#show'

  root to: 'main#index'
end
