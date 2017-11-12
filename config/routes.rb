Rails.application.routes.draw do
  root to: 'restaurants#index'
  get 'restaurants' => 'restaurants#index'
  get 'restaurants/new' => 'restaurants#new', as: "new_restaurant"
  post 'restaurants' => 'restaurants#create'
  get 'restaurants/:id' => 'restaurants#show', as: "restaurant"
  get 'restaurants/:restaurant_id/reviews/new' => "reviews#new", as: "new_restaurant_review"
  post 'restaurants/:restaurant_id/reviews' => "reviews#create", as: "restaurant_reviews"

  # namespace :admin do
  #   resources :restaurants
  # end

  # namespace :admin do
  #   resources :reviews, only: [ :edit, :update, :destroy ]
  # end

  namespace :admin do
    resources :restaurants do
      resources :reviews, only: [ :edit, :update, :destroy ]
    end
  end

end

