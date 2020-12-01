Rails.application.routes.draw do
  # ここから（devise_forとルーティングがかぶるから別に記載)
  # get '/customers/:id/edit' => 'public/customers#edit'
  patch '/customers/:id/update' => 'public/customers#update', as:'update_customer'
  # ここまで
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

# コントローラ〜削除時にエラ〜の場合は否の文を消す
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  scope module: :public do
    # get '/customers/:id/edit' => 'customers#edit', as: 'edit_customer'
    resources :customers, only: [:edit, :show, :unsubscrib, :withdraw, :update]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    #ここからcart_items
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    # ここまでcart_items
    # ここからorders
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :complete, :create, :index, :show]
    # ここまでorders
    # :unsubscrib, :withdrawはresourcesでは働かないので21行目のように記載する必要がある
    # resourcesではなくresourceを使うとURL直打ちでアクセスできないようになるがfind(params[:id])でピックアップできなくなる
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :create, :edit, :update, :unsubscrib, :withdraw, :show]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラーを利用してルートパス を設置
  get '/' => 'public/homes#top'
  get '/admin' => 'admin/homes#top'
  get '/about' => 'public/homes#about'

  get '/customers/my_page' => 'publics/customers#show', as: 'customers'

end
