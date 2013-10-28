Os::Application.routes.draw do
  scope '/os' do
    # Session
    match '/login' => 'sessions#create', via: [:get, :post]
    match '/logout' => 'sessions#destroy', via: [:get, :post]

    # Reports
    get "reports/index"
    post "reports/new"
    get "reports/balance"

    # User
    resources :users, except: [:new]
    get 'add_new_user' => 'users#new'

    resources :categories
    resources :supplies
    resources :services
    resources :items, only: [:create, :destroy]
    resources :reports, only: [:index, :print]
    resources :orders do
      get :find_item, :on => :collection
    end
    get "/orders/:id/print" => 'orders#print'

    # You can have the root of your site routed with "root"
    root 'services#index'
  end
end
