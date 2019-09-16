require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many(:olympians).through :olympian_games }
    it { should have_many(:sports).through :game_sports }
  end

end
