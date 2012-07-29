IHeartQuotes::Application.routes.draw do
  mount CustomQuotes::Engine => "/custom_quotes", as: 'custom_quotes'

  resources :quote_sources
  resources :quotes

  root to: 'quotes#random'
end
