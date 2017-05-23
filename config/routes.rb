Rails.application.routes.draw do
  resources :data_sets
  resources :tweets
  resources :tweeters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
