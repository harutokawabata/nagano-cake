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

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  scope module: :public do
    # get '/customers/:id/edit' => 'customers#edit', as: 'edit_customer'
    resources :customers, only: [:edit, :show, :unsubscrib, :withdraw]
    # :unsubscrib, :withdrawはresourcesでは働かないので20行目のように記載する必要がある
    # resourcesではなくresourceを使うとURL直打ちでアクセスできないようになるがfind(params[:id])でピックアップできなくなる
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラーを利用してルートパス を設置
  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'

  get '/customers/my_page' => 'public/customers#show', as: 'customers'

end
