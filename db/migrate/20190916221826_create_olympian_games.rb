class CreateOlympianGames < ActiveRecord::Migration[5.2]
  def change
    create_table :olympian_games do |t|
      t.references :olympians, foreign_key: true
      t.references :games, foreign_key: true

      t.timestamps
    end
  end
end
