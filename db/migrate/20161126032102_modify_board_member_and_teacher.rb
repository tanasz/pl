class ModifyBoardMemberAndTeacher < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :is_teacher, :teacher?
    rename_column :users, :teacher?, :teacher
    rename_column :users, :is_board_member, :board_member?
    rename_column :users, :board_member?, :board_member
  end
end
