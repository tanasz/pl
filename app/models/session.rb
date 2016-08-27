class Session < ApplicationRecord
  has_many :attendances, dependant: :destroy
end
