class Game < ApplicationRecord
  validates_presence_of :name

  has_many :olympians,  through: :olympian_games
  has_many :olympian_games
  has_many :game_sports
  has_many :sports, through: :game_sports
end
