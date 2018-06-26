Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'items' => 'items'

  get 'items/new'
  get 'items/create' => 'items#create'

  root 'items#index'

end
