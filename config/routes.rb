Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  root "articles#index"
  
  resources :articles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
