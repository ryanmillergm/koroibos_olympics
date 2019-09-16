class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string :name
      t.string :team
      t.integer :age
      t.string :sex
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
