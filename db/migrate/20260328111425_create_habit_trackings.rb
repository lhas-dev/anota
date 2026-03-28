class CreateHabitTrackings < ActiveRecord::Migration[8.1]
  def change
    create_table :habit_trackings do |t|
      t.references :habit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :tracked_on, null: false
      t.integer :score, null: false, default: 10

      t.timestamps
    end

    add_index :habit_trackings, [ :habit_id, :tracked_on ], unique: true
    add_index :habit_trackings, [ :user_id, :tracked_on ]
  end
end
