class CreateGameSports < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sports do |t|
      t.references :game, foreign_key: true
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
