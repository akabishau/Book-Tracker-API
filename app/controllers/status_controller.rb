class StatusController < ApplicationController
  before_action :authenticate_user!, only: [:auth_check]

  def check
    render json: { status: "Service is up" }, status: :ok
  end

  # status is http status code
  def auth_check
    if user_signed_in?
      render json: { authenticated: true, user: current_user }, status: :ok
    else
      render json: { authenticated: false }, status: :unauthorized
    end
  end
end
