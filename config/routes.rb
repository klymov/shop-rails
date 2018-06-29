Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'home' => 'home#index'
  get 'contacts' => 'home#contacts'
  get 'delivery' => 'home#delivery'
  get 'items' => 'items#index'

  get 'items/new'
  get 'items/create' => 'items#create'
  get 'items/:id', to: 'items#show', as: 'item'

  root 'home#index'

end
