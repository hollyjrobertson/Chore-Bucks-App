Rails.application.routes.draw do
  resources :users
  resources :sessions, only:[:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'

  get 'index', to: 'users#index', as: 'index'

  get 'about/index'

  get 'about' => 'about#index'

  get 'home' => 'welcome#index'

  get 'login', to: 'sessions#new', as: 'login'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'contact', to: 'welcome#contact', as: 'contact'

  get 'ryan', to: 'welcome#ryan_contact', as: 'ryan'

  get 'shiva', to: 'welcome#shiva_contact', as: 'shiva'

  get 'holly', to: 'welcome#holly_contact', as: 'holly'

  root 'welcome#index'

end
