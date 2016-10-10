class AddBoardMemberRefToTraining < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings_board_members, id: false do |t|
      t.belongs_to :trainings, index: true
      t.belongs_to :board_members, index: true
    end
  end
end
