SocialMediaWordCloud::Application.routes.draw do
  root to: 'application#index'

  resources :feed, only: :index
  resources :posts, only: :index
end
