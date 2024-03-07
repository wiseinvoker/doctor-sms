class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.string :phone_number

      t.timestamps
    end
  end
end
