Rails.application.routes.draw do
  
  root "posts#index"
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :posts, only: [:index, :create, :update, :destroy]

end
