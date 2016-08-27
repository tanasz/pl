class Attendance < ApplicationRecord
  belongs_to :session
  belongs_to :user
  validates :session, presence: :true
  validates :user, presence: :true
end
