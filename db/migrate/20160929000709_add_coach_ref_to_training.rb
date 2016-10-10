class AddCoachRefToTraining < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings_coaches, id: false do |t|
      t.belongs_to :trainings, index: true
      t.belongs_to :coaches, index: true
    end
  end
end
