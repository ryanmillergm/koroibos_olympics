class EventsFacade
  def sport_events
    Sport.each_sport_with_events
  end

  def medalists(params)
    Olympian.find_medalists(params[:id])
  end
end
