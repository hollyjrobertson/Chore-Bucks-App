Rails.application.routes.draw do
  resources :users

  resources :sessions, only:[:new, :create, :destroy]

  root 'welcome#index'

  get 'signup' => 'users#new'

  get 'about' => 'welcome#about'

  get 'home' => 'welcome#index'

  get 'login'   => 'sessions#new'

  post   'login'   => 'sessions#create'

  delete 'logout'  => 'sessions#destroy'

  get 'contact', to: 'welcome#contact', as: 'contact'

  get 'ryan', to: 'welcome#ryan_contact', as: 'ryan'

  get 'shiva', to: 'welcome#shiva_contact', as: 'shiva'

  get 'holly', to: 'welcome#holly_contact', as: 'holly'

end
