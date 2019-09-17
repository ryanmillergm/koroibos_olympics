class Api::V1::OlympianStatsController < ApplicationController
  def index
    olympian_stats = OlympianStatsFacade.new
    render json: olympian_stats.statistics
  end
end
