CaseDashboard::Application.routes.draw do

  scope 'api', defaults: { format: :json } do
    resources :cases, only: [:index, :update]
    resources :labels, only: [:index, :create]
  end

  get 'templates/:template' => 'templates#show'
  get '*path' => 'static#show'

  root to: 'main#index'
end
