class OlympiansEvent < ApplicationRecord
  # validates_presence_of :olympians_id
  # validates_presence_of :events_id

  belongs_to :event
  belongs_to :olympian
end
