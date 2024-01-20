# Rails.application.routes.draw do
#   devise_for :users, controllers: {
#     registration: "users/registrations"
#   }

#   get "check", to: "status#check"
# end

Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth"
  as :user do
    # Define routes for User within this block.
  end
  get "status/check", to: "status#check"
  get "status/auth_check", to: "status#auth_check"
end
