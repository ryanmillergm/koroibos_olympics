class CreateOlympianGames < ActiveRecord::Migration[5.2]
  def change
    create_table :olympian_games do |t|
      t.references :game, foreign_key: true
      t.references :olympian, foreign_key: true

      t.timestamps
    end
  end
end
