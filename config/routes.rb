RebelFoundation::Application.routes.draw do
  resources :users
  resource  :session

  # OAuth how you humor me so ...
  match '/auth/:provider/callback' => 'session#create'
  
  root to: 'homepages#index'
end
