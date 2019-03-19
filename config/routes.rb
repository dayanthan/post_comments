Rails.application.routes.draw do
  resources :posts do
  	resources :comments
  end 
  devise_for :users
  get 'welcome', to: 'users#welcome', as: 'welcome'
  get 'all_posts', to: 'posts#all_posts', as: 'all_posts'
  get 'all_comments/:id', to: 'comments#all_comments', as: 'all_comments'
  post 'new_comment', to: 'comments#new_comment', as: 'new_comment'
  post 'favorite', to: 'posts#favorite', as: 'favorite'
  root :to => "posts#index"
end
