Rails.application.routes.draw do

  resources :categories do
    resources :subcategories
  end

  resources :conditions

  resources :listings do
    resources :comments
    collection do
      get 'search'
    end
    member do
    put "like", to: "listings#upvote"
    end
  end

  # Static Pages
  match '/about', to: 'pages#about', via: :get
  match '/career', to: 'pages#career', via: :get
  match '/cookie', to: 'pages#cookie', via: :get
  match '/copyright', to: 'pages#copyright', via: :get
  match '/corporate', to: 'pages#corporate', via: :get
  match '/customersupport', to: 'pages#customersupport', via: :get
  match '/design', to: 'pages#design', via: :get
  match '/faq', to: 'pages#faq', via: :get
  match '/following', to: 'pages#following', via: :get
  match '/help', to: 'pages#help', via: :get
  match '/marketing', to: 'pages#marketing', via: :get
  match '/membership', to: 'pages#membership', via: :get
  match '/newsletter', to: 'pages#newsletter', via: :get
  match '/mobile', to: 'pages#mobile', via: :get
  match '/offline', to: 'pages#offline', via: :get
  match '/postads', to: 'pages#postads', via: :get
  match '/postterm', to: 'pages#postterm', via: :get
  match '/prices', to: 'prices#index', via: :get
  match '/privacy', to: 'pages#privacy', via: :get
  match '/safety', to: 'pages#safety', via: :get
  match '/safetytips', to: 'pages#safetytips', via: :get
  match '/sales', to: 'pages#sales', via: :get
  match '/scams', to: 'pages#scams', via: :get
  match '/technology', to: 'pages#technology', via: :get
  match '/terms', to: 'pages#terms', via: :get

  # Sub/Categories
  match '/categories/show', to: 'categories#show', via: :get

  match '/subcategories/chargable', to: 'subcategories#chargable', via: :get
  match '/subcategories/find_by_category', to: 'subcategories#find_by_category', via: :get

  # Listing
  match '/listings/payment/:id', to: 'listings#payment', via: :get
  match '/listings/create_payment/:id', to: 'listings#create_payment', via: :post
  match '/listings/upload/:id', to: 'listings#upload', via: :get
  match '/listings/create_upload/:id', to: 'listings#create_upload', via: :post
  match '/listings/update_upload/:id', to: 'listings#update_upload', via: :patch
  match '/listings/sold/:id', to: 'listings#sold', via: :get
  match '/listings/unsold/:id', to: 'listings#unsold', via: :get
  match '/listings/show_json/:id', to: 'listings#show_json', via: :get

  match '/prices/index', to: 'prices#index', via: :get
  match '/howitworks/index', to: 'howitworks#index', via: :get

  # User (Device)
  devise_for :users
  get ':username' => 'users#show', as: 'user'
  match '/users/update', to: 'users#update', via: :put
  # devise_for :users, controllers: {
  #   passwords: "passwords",
  #   registrations: "registrations",
  #   sessions: "sessions"
  # }

  root 'categories#index'
end
