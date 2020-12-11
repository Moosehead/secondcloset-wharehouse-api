require 'rails_helper'

RSpec.describe ChargeFee, type: :model do
  it { should validate_presence_of(:value) }
end
