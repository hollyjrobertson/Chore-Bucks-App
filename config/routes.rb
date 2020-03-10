Rails.application.routes.draw do
  get 'about/index'

  get 'about' => 'about#index'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'welcome#index'

  get 'home' => 'welcome#index'
end
