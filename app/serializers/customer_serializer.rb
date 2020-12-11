class CustomerSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  has_many :discounts
  has_many :charge_values
  has_many :charge_volumes
end
