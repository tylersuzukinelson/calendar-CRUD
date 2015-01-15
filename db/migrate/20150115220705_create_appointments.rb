class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :appt_time
      t.integer :duration
      t.string :task
      t.text :details
      t.string :person

      t.timestamps null: false
    end
  end
end
