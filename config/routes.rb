CompleteMe::Application.routes.draw do
  resource :account, only: [:show]

  resources :users, only: [] do
    resource :profile
  end

end
