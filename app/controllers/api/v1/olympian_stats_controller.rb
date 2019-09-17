class Api::V1::OlympianStatsController < ApplicationController
  def index
    render json: OlympianStatsFacade.new
  end
end
