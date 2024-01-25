Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth"
  get "status/check", to: "status#check"
  get "status/auth_check", to: "status#auth_check"
  # controller namespace: Api::V1 (capitalized) and path: api/v1 (lowercased)
  namespace :api do
    namespace :v1 do
      resources :books, only: [:create, :index]
    end
  end
end
