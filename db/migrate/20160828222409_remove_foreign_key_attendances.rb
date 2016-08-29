class RemoveForeignKeyAttendances < ActiveRecord::Migration[5.0]
  def change
    remove_column :attendances, :session_id
  end
end
