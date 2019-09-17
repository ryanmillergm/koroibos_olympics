class Api::V1::Events::SearchMedalistsController < ApplicationController
  def index
    events = EventsFacade.new
    render json: events.medalists(event_params)
  end

  private

  def event_params
    params.permit(:id)
  end
end
