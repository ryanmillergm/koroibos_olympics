class Sport < ApplicationRecord
  validates_presence_of :name

  has_many :game_sports
  has_many :games, through: :game_sports
  has_many :events
end
