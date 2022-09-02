Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :checkpoints
      resources :trips
      resources :users
    end
  end
end
