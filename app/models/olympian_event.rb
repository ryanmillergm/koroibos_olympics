class OlympianEvent < ApplicationRecord
  belongs_to :event
  belongs_to :olympian

  def self.get_medal(medalist_id, event_id)
    where(olympian_id: medalist_id, event_id: event_id).pluck(:medal).first
  end
end
