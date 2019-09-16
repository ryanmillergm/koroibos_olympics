class OlympianGame < ApplicationRecord
  # validates_presence_of :games_id
  # validates_presence_of :olympians_id

  belongs_to :game
  belongs_to :olympian
end
