class ChangeTypeOfDuration < ActiveRecord::Migration[5.0]
  def change
    change_column :trainings, :duration, :string
  end
end
