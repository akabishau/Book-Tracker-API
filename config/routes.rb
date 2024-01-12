Rails.application.routes.draw do
  get "check", to: "status#check"
end
