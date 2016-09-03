class Training < ApplicationRecord
  has_many :attendances, -> { order('created_at DESC') }
  scope :active, -> {where('date_time >= ?', Time.current)}
end
