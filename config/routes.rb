Rails.application.routes.draw do
  root "books#index" # Home page shows book list

  resources :books do
    member do
      post :borrow
      post :return
    end
  end
  

  resources :borrowers, only: [:index, :show, :new, :create]

  resources :borrowing_records, only: [:index, :show]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
