class EventsFacade
  def sport_events
    Sport.each_sport_with_events
  end
end
