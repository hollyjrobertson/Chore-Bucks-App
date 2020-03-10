Rails.application.routes.draw do
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  get 'about/index'

  get 'about' => 'about#index'

  get 'home' => 'welcome#index'

  get 'signup', to: 'users#new', as: 'signup'

  get 'login', to: 'sessions#new', as: 'login'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'contact', to: 'welcome#contact', as: 'contact'

  root 'welcome#index'

end
