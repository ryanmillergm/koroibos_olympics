class Olympian < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :team
  validates_presence_of :age
  validates_presence_of :weight
  validates_presence_of :height

  has_many :olympian_events
  has_many :olympian_games
  has_many :game_sports
  has_many :games, through: :olympian_games
  has_many :events, through: :olympian_events
  has_many :sports, through: :game_sports

  def total_medals_won
    OlympianEvent.where(olympian_id: id, medal: ["Gold","Silver","Bronze"]).count
  end

  def sport
    Sport.joins(:olympians).where(olympians: { id: id }).distinct.pluck(:name)
  end

end
