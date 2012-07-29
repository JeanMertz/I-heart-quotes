IHeartQuotes::Application.routes.draw do
  resources :quote_sources
  resources :quotes

  root to: 'quotes#random'
end
