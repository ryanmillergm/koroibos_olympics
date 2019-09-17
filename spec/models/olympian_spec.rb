require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :team }
    it { should validate_presence_of :age }
    it { should validate_presence_of :weight }
    it { should validate_presence_of :height }
  end

  describe 'relationships' do
    it { should have_many :olympian_events }
    it { should have_many :olympian_games }
    it { should have_many :game_sports }
    it { should have_many(:games).through :olympian_games }
    it { should have_many(:events).through :olympian_events }
    it { should have_many(:sports).through :game_sports }
  end


end
