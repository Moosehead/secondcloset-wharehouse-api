class ChargeValue < ApplicationRecord
  belongs_to :customer

  # validation
  validates_presence_of :value
  validates_numericality_of :value,  :less_than_or_equal_to => 1
end
