class Olympian < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :team
  validates_presence_of :age
  validates_presence_of :weight
  validates_presence_of :height

  has_many :games, through: :olympians_games
  has_many :events, through: :olympians_events
end
