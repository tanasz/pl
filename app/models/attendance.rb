class Attendance < ApplicationRecord
  belongs_to :training
  belongs_to :user
  validates :training, presence: :true
  validates :user, presence: :true
end
