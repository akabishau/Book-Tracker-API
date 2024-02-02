class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include RackSessionFixController
  wrap_parameters format: []
end
