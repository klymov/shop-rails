Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'home' => 'home#index'
  get 'contacts' => 'home#contacts'
  get 'delivery' => 'home#delivery'
=begin
  get 'items' => 'items#index'

  get 'items/new'
  get 'items/create' => 'items#new'
  get 'items/:id', to: 'items#show', as: 'item'
=end
  resources :items

  root 'home#index'

end
