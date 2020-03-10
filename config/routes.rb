Rails.application.routes.draw do
  resources :users
  get 'about/index'

  get 'about' => 'about#index'

  get 'signup' => 'sessions/create'

  get 'logout' => 'sessions/destroy'

  root 'welcome#index'

  get 'home' => 'welcome#index'
end
