require 'rails_helper'

RSpec.describe ChargeVolume, type: :model do
  it { should belong_to(:customer) }

  it { should validate_presence_of(:value) }
end
