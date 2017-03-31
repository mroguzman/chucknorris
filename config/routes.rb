Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'random',  to: 'facts#random'
  get 'category', to: 'facts#category'
  get 'search', to: 'facts#search'
end
