Rails.application.routes.draw do
  resources :comments
  namespace :api do
    namespace :v1 do
      resources :checkpoints
      resources :trips
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

end
