CaseDashboard::Application.routes.draw do
  get 'templates/:template' => 'templates#show'
  get '*path' => 'static#show'

  root to: 'main#index'
end
