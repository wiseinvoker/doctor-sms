class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
