Rails.application.routes.draw do
  # ここから（devise_forとルーティングがかぶるから別に記載)
  get '/customers/:id/edit' => 'public/customers#edit'
  patch '/customers/:id/update' => 'public/customers#update', as:'update_customer'
  # ここまで
  devise_for :customers
  devise_for :users
  scope module: :public do
    resources :customers, only: [:show, :unsubscrib, :withdraw]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'

  get '/customers/my_page' => 'public/customers#show', as: 'customers'

end