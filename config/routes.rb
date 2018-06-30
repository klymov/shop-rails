Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  get 'home' => 'home#index'
  get 'contacts' => 'home#contacts'
  get 'delivery' => 'home#delivery'

  resources :items

  root 'home#index'

end
