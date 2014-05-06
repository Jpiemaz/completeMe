CompleteMe::Application.routes.draw do
  resource :account, only: [:show]

  resources :tasks, only: [:edit, :update, :show, :destroy]

  resources :users, only: [] do
    resource :profile
    resources :tasks, only: [:index, :new, :create]
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end
end
