require "rails_helper"

RSpec.describe GameSport, type: :model do
  describe 'relationships' do
    it { should belong_to :game }
    it { should belong_to :sport }
  end
end
