RebelFoundation::Application.routes.draw do

  # Users
  resources :users do
    resources :providers, controller: 'users/providers' do
      get :update
      get :destroy
    end
  end
  match '/dashboard' => 'users#dashboard', as: :dashboard
  match '/profile'   => 'users#edit',      as: :profile

  # Session
  resource  :session
  match '/logout' => 'session#destroy', as: :logout

  # OAuth how you humor me so ...
  match '/auth/:provider/callback' => 'session#create'
  
  root to: 'homepages#index'
end
