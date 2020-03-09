Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  root 'sessions#create'
end
