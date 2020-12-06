Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :blogs
      resources :users
    end
  end
  resource :sessions, only: [:new, :create], as: :login
  delete '/logout',  to: 'sessions#destroy'
end
