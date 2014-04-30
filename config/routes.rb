CompleteMe::Application.routes.draw do
  resource :account, only: [:show]

  resources :users, only: [] do
    resource :profile
    resources :tasks, only: [:index, :new, :create] 
  end

end
