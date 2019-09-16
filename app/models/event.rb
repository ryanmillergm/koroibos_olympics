class Event < ApplicationRecord
  validates_presence_of :name

  belongs_to :sports
  has_many :olympians, through: :olympians_events
  has_many :olympians_events
end
