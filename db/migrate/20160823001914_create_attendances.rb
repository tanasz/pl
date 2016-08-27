class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.text :commentary
      t.boolean :incident
      t.string :incident_type

      t.timestamps
    end
  end
end
