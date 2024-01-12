class StatusController < ApplicationController
  def check
    render json: { status: "Service is up" }
  end
end
