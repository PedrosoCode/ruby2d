Rails.application.routes.draw do
  # Páginas estáticas
  get 'home/index'

  # Autenticação
  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Verificação de saúde da aplicação
  get "up" => "rails/health#show", as: :rails_health_check

  # Define a rota raiz
  root "home#index"

  # config/routes.rb
get 'welcome', to: 'home#welcome'

end

