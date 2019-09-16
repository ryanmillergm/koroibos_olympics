class CreateOlympiansEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians_events do |t|
      t.string :medals
      t.references :events, foreign_key: true
      t.references :olympians, foreign_key: true

      t.timestamps
    end
  end
end
