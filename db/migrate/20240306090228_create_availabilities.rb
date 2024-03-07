class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.integer :day_of_week
      t.time :start_time
      t.time :end_time
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
