Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:show]
  resources :items do
    collection do
      get 'search'
      get 'import_page'
      post 'import'
    end
  end

  get 'data_exports/export_csv'
  get 'data_exports/user_export_csv'
  root to: "items#index"
end
