class AddOlympianRefToGameSports < ActiveRecord::Migration[5.2]
  def change
    add_reference :game_sports, :olympian, foreign_key: true
  end
end
