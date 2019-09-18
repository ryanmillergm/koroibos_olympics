class EventsFacade
  def sport_events
    Sport.each_sport_with_events
  end

  def medalists(params)
    response = {}
    response["event"] = Event.find(params[:id]).name

    medalists = Olympian.find_medalists(params[:id])
    if medalists == []
      return "There were no medalists for that event."
    else
      events_medalists = medalists.map do |medalist|
        response["medalists"] =
          {
            "name": medalist.name,
            "team": medalist.team,
            "age": medalist.age,
            "medal": OlympianEvent.get_medal(medalist.id, params[:id])
          }
      end
    end
    response["medalists"] = events_medalists
    response
  end
end
