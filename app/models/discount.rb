class Discount < ApplicationRecord
  belongs_to :customer
  after_initialize :set_defaults, unless: :persisted?

  # validation
  validates_presence_of :value,:quantity
  validates_numericality_of :value,  :less_than_or_equal_to => 1
  validates_numericality_of :quantity,  :other_than => 0



  def set_defaults
    self.quantity_used = 0
    self.active = true
  end
end
