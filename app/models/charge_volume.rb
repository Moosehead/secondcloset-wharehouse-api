class ChargeVolume < ApplicationRecord
  belongs_to :customer

  # validation
  validates_presence_of :value
end
