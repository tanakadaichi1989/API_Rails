class CreateTimetables < ActiveRecord::Migration[5.1]
  def change
    create_table :timetables do |t|
      t.string :dept_time
      t.string :train_type
      t.string :destination
      t.text :memo

      t.timestamps
    end
  end
end
