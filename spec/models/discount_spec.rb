require 'rails_helper'

RSpec.describe Discount, type: :model do
  it { should belong_to(:customer) }

  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:value) }



end
