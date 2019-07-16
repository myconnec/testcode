Rails.application.routes.draw do

  devise_for :users

  resources :categories do
  	resources :subcategories
  end

  resources :listings do
    resources :comments
    collection do
      get 'search'
    end
    member do
		 put "like",    to: "listings#upvote"
	  end
  end

  resources :charges, only: [:new, :create]

  root 'categories#index'

  match '/about', to: 'pages#about', via: :get
  match '/contact', to: 'pages#contact', via: :get
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
  match '/mobile', to: 'pages#mobile', via: :get
  match '/postads', to: 'pages#postads', via: :get
  match '/privacy', to: 'pages#privacy', via: :get
  match '/safety', to: 'pages#safety', via: :get
  match '/safetytips', to: 'pages#safetytips', via: :get
  match '/sales', to: 'pages#sales', via: :get
  match '/scams', to: 'pages#scams', via: :get
  match '/technology', to: 'pages#technology', via: :get
  match '/terms', to: 'pages#terms', via: :get
  match '/postterm', to: 'pages#postterm', via: :get
  match '/subcategories/find_by_category', to: 'subcategories#find_by_category', via: :get

  get ':username' => 'users#show', as: 'user'
end
