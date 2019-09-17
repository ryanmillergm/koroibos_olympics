class Api::V1::EventsController < ApplicationController
  def index
    events = EventsFacade.new
    render json: events.sport_events
  end
end
