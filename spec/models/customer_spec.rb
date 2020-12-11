require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:discounts).dependent(:destroy) }
  it { should have_many(:charge_volumes).dependent(:destroy) }
  it { should have_many(:charge_values).dependent(:destroy) }

  it { should validate_presence_of(:name) }
end
