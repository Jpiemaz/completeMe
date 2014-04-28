CompleteMe::Application.routes.draw do
  resource :account, only: [:show]

  resources :users, only: :nothing do
    resource :profile
  end

end
