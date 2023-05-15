Rails.application.routes.draw do
  devise_for :users
  resources :items do
    collection do
      get 'search'
    end
  end
  
  root to: "items#index"
end
