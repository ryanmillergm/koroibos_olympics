class GameSport < ApplicationRecord
  belongs_to :game
  belongs_to :sport
  belongs_to :olympian
end
