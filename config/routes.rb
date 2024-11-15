Rails.application.routes.draw do
  root 'jobs#index'
  resources :jobs, only: %i[index show] do
    resources :applications, only: %i[new create]
    collection do
      get :import
      post :import
    end
  end
end
