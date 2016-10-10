class Training < ApplicationRecord
  has_many :attendances, -> { order('created_at DESC') }
  has_and_belongs_to_many :board_members,
                          :class_name => 'User',
                          :join_table => 'trainings_board_members',
                          :foreign_key => 'board_members_id',
                          :association_foreign_key => 'trainings_id'
  has_and_belongs_to_many :coaches,
                          :class_name => 'User',
                          :join_table => 'trainings_coaches',
                          :foreign_key => 'coaches_id',
                          :association_foreign_key => 'trainings_id'
  scope :active, -> {where('date_time >= ?', Time.current)}
end
