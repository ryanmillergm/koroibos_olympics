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

  def self.youngest
    Olympian.where(age: minimum(:age)).first
  end

  def self.oldest
    Olympian.where(age: maximum(:age)).first
  end

  def self.total_competing_olympians
    Olympian.count
  end

  def self.average_weight(gender)
    Olympian.where(sex: gender).average(:weight).to_f.round(1)
  end

  def self.average_age
    Olympian.average(:age).to_f.round(1)
  end

end
