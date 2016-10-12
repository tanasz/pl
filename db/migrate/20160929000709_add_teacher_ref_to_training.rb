class AddTeacherRefToTraining < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings_teachers, id: false do |t|
      t.belongs_to :trainings, index: true
      t.belongs_to :teachers, index: true
    end
  end
end
