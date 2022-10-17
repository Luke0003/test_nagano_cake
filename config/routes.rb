Rails.application.routes.draw do
  namespace :admin do
    devise_for :admins, skip: [:registrations, :password], controllers: {
     sessions: "admin/sessions"
  }

    root 'homes#top'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:show, :update]

    resources :order_items, only: [:update]
  end

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes/#about'

    resources :items, only: [:index, :show]

    devise_for :customers, skip: [:password], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    get '/customers/information' => 'customers#update'
    get '/customers/confirm'
    patch '/customers/withdraw'

    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete '/cart_items/destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm'
    get '/orders/finish'

    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
