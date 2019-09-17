require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :game_sports }
    it { should have_many(:games).through :game_sports }
    it { should have_many :events }
    it { should have_many(:olympians).through :game_sports }
  end

end
