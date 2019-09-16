class Game < ApplicationRecord
  validates_presence_of :name

  has_many :olympians,  through: :olympian_games
end
