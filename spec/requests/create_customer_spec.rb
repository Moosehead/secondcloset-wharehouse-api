# spec/requests/todos_spec.rb
require 'rails_helper'
  # Test suite for POST /todos

RSpec.describe 'Creates new customer', type: :request do
let!(:charge_fees) { create(:charge_fee) }

  describe 'POST api/customer/create' do
    # valid payload

    let(:valid_attributes1) { 
      { name: 'A', discount: [{value:0.10,quantity:100}]} 
  }

    let(:valid_attributes2) { 
        { name: 'B', discount: [{value:0.10,quantity:100},{value:0.15,quantity:150},{value:0.20,quantity:-1}], charge_value:0.05, charge_volume:2} 
    }

    context 'when the request is valid with just discount param' do
      before { post '/api/customer/create', params: valid_attributes1 }

      it 'creates a new customer record' do
        expect(json['name']).to eq('A')
      end

      it 'creates a new discount record' do
        expect(Discount.last.value).to eq(0.10)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is valid with multiple discount parameters' do
      before { post '/api/customer/create', params: valid_attributes2 }
  
      it 'creates a new customer record' do
        expect(json['name']).to eq('B')
      end

      it 'creates a  2 limited quantity discount records' do
        expect(Discount.where(customer_id:json['id'] ,active: true, no_limit: false).length).to eq(2)

      end

      it 'creates  1 limited quantity discount records' do
        expect(Discount.where(customer_id:json['id'] ,active: true, no_limit: true).length).to eq(1)
      end

      it 'creates  1 charge value record' do
        expect(ChargeValue.where(customer_id:json['id']).last.value).to eq(0.05)
      end

      it 'creates  1 charge volume record' do
        expect(ChargeVolume.where(customer_id:json['id']).last.value).to eq(2)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/customer/create', params: { name: 'A', discount: [{value:10,quantity:100}]}  }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Value must be less than or equal to 1/)
      end
    end



  end

end