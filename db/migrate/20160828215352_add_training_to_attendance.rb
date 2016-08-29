class AddTrainingToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_reference :attendances, :training, foreign_key: true
  end
end
