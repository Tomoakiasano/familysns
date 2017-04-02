Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  
  # get 'devise/reg	istrations#new'
  root 'posts#index'

  delete '/posts/:id/' => 'posts#destroy', as: 'destroy_post'

end
