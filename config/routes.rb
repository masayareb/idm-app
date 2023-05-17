Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  resources :items do
    collection do
      get 'search'
    end
  end
  
  root to: "items#index"
end
