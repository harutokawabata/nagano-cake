Rails.application.routes.draw do
  devise_for :customers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'

  get '/customers/my_page' => 'public/customers#show', as: 'customers'
  resources :customers, only: [:show, :edit, :update, :unsubscrib, :withdraw]

end