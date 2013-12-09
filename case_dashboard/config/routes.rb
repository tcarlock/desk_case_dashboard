CaseDashboard::Application.routes.draw do

  namespace :api do
    resources :cases
  end

  get 'templates/:template' => 'templates#show'
  get '*path' => 'static#show'

  root to: 'main#index'
end
