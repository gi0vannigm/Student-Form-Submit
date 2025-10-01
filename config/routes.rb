Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  post "/students", to: "students#create"

  # get "/students/:name", to: "students#show"

  # get "/students", to: "students#index"

  # get "/students/new", to: "students#new"
  # post "/students", to: "students#create"

  # get "/students/:id", to: "students#show"

  # get "/students/:id/edit", to: "students#edit"
  # patch "/students/:id", to: "students#update"
  # put "/students/:id", to: "students#update"

  # delete "/students/:id", to: "students#destroy"
  # or...
  resources :students do
    collection do
      post :import
    end
  end

  root "students#index"
end
