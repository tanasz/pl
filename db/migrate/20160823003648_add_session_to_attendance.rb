class AddSessionToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_reference :attendances, :session, foreign_key: true
  end
end
