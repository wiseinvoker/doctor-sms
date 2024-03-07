class AddStatusAndChangeDayOfWeekToDateToAvailabilities < ActiveRecord::Migration[7.0]
  def change
    add_column :availabilities, :status, :string
    change_column :availabilities, :day_of_week, :date
  end
end