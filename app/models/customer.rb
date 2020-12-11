class Customer < ApplicationRecord
    # model association
    has_many :items, dependent: :destroy
    has_many :discounts, dependent: :destroy
    has_many :charge_volumes, dependent: :destroy
    has_many :charge_values, dependent: :destroy

    # validations
    validates_presence_of :name
end
