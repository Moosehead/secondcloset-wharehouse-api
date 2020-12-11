class DiscountSerializer < ActiveModel::Serializer
  attributes :id,:value,:quantity,:quantity_used,:active,:no_limit
end
