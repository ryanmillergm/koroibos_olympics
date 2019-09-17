class AddMedalToOlympianEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :olympian_events, :medal, :string
  end
end
