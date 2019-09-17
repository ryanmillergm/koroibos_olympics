require "rails_helper"

RSpec.describe OlympianGame, type: :model do
  describe 'relationships' do
    it { should belong_to :game }
    it { should belong_to :olympian }
  end
end
