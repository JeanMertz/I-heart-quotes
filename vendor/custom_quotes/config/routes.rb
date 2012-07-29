CustomQuotes::Engine.routes.draw do
  resources :quotes
  get 'random'  => 'quotes#random'
  root to: 'quotes#index'
end
