class Training < ApplicationRecord
  has_many :attendances, -> { order('created_at DESC') }
  has_and_belongs_to_many :board_members,
                          :class_name => 'User',
                          :join_table => 'trainings_board_members',
                          :foreign_key => 'board_members_id',
                          :association_foreign_key => 'trainings_id'
  has_and_belongs_to_many :teachers,
                          :class_name => 'User',
                          :join_table => 'trainings_teachers',
                          :foreign_key => 'teachers_id',
                          :association_foreign_key => 'trainings_id'
  scope :active, -> {where('date_time >= ?', Time.current)}

  def delete_teacher(teacher)
    self.teachers.delete(teacher)
  end

  def delete_board_member(board_member)
    self.board_members.delete(board_member)
  end

end
