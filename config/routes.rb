IHeartQuotes::Application.routes.draw do
  mount CustomQuotes::Engine => "/custom_quotes", as: 'custom_quotes'

  resources :quote_sources
  resources :quotes

  put '/cache_weight' => 'quote_sources#set_cache_weight'

  root to: 'quotes#random'
end
