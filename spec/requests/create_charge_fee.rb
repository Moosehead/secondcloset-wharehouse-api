# spec/requests/todos_spec.rb
require 'rails_helper'
  # Test suite for POST /todos

RSpec.describe 'Customer API', type: :request do
let!(:customers) { create_list(:customer,10) }
let!(:charge_fees) { create(:charge_fee) }


  describe 'POST /customer/fee' do
    # valid payload
    let(:valid_attributes) { { value:20} }

    context 'when the request is valid' do
      before { post '/api/customer/fee', params: valid_attributes }
      it 'creates a new fee' do
        expect(json['value']).to eq(20)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  end

end