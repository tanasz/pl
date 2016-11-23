class Attendance < ApplicationRecord
  belongs_to :training
  belongs_to :user
  validates :training, presence: :true
  validates :user, presence: :true
  default_scope { order(updated_at: :desc) } # TODO : trouver comment indexer scope par defaut sur date training DESC
end
