Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :favorites, only: :index do
      get :users, on: :member
    end
  end

  resources :favorites, only: [:index, :create, :destroy]
end
