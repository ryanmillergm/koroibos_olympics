class Sport < ApplicationRecord
  validates_presence_of :name

  has_many :game_sports
  has_many :games, through: :game_sports
  has_many :events
  has_many :olympians, through: :game_sports

  def self.each_sport_with_events
    response = {}
    sports = Sport.all
    events = sports.map do |sport|
      response["events"] =
        {
          "sport": sport.name,
          "events": Event.where(sport_id: sport.id).pluck(:name)
        }
    end
    response["events"] = events
    response
  end
end
