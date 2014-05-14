CompleteMe::Application.routes.draw do
  resource :account, only: [:show]
  resource :search, only: [:show]

  resources :activities, only: [:index]

  resources :comments, only: [:destroy] do
    member do
      post "like" => "comment_likes#create"
      delete "unlike" => "comment_likes#destroy"
    end
  end

  resources :tasks, only: [:edit, :update, :show, :destroy] do
    resource :completion
    resource :image, only: [:new, :create, :update]
    resources :comments, only: [:create]
    member do
      post "like" => "task_likes#create"
      delete "unlike" => "task_likes#destroy"
    end
  end

  resources :users, only: [] do
    resource :profile
    resources :tasks, only: [:index, :new, :create]
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end
end
