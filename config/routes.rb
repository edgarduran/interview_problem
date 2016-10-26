Rails.application.routes.draw do

  root 'home#index'

  resources :users, only: [:index, :show]

 namespace :api, defaults: { format: :json } do
   resources :users, only: [:index, :show, :create]
 end
end
