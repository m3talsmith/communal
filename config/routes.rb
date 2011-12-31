RebelFoundation::Application.routes.draw do

  # Users
  resources :users
  match '/dashboard' => 'users#dashboard', as: :dashboard
  match '/profile'   => 'users#edit',      as: :profile

  # Session
  resource  :session
  match '/logout' => 'session#destroy', as: :logout

  # OAuth how you humor me so ...
  match '/auth/:provider/callback' => 'session#create'
  
  root to: 'homepages#index'
end
