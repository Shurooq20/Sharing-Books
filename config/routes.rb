Rails.application.routes.draw do


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories do
        resources :books, shallow: true
      end
      resource :session, only: [:create, :destroy]

      # get("/users/current", to: "sessions#current")
      resources :users, only: [:create]

    end
  end
end
