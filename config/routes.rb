IHeartQuotes::Application.routes.draw do
  resources :quote_sources

  root to: 'quotes#random'
end
