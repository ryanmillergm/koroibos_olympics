class CreateGamesSports < ActiveRecord::Migration[5.2]
  def change
    create_table :games_sports do |t|
      t.references :games, foreign_key: true
      t.references :sports, foreign_key: true

      t.timestamps
    end
  end
end
