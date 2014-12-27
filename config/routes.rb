MyanApi::Application.routes.draw do
  resources :route_keys

  resources :custom_routes

  resources :groups

  resources :members

  resources :members, except: [:new, :edit]
  resources :groups, except: [:new, :edit]
  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"


  devise_for :users

  # DB routing
  resources :custom_routes
  get 'api/(*route)', controller: "customer_routes", action: "api_finder", constraints: lambda { |request|
    # puts "Request: #{request.inspect}"
    ApiRouter.new(request)
  }

  namespace :admin do
    root "base#index"
    resources :users

  end

end
