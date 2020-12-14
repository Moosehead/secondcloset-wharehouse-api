# spec/requests/todos_spec.rb
require 'rails_helper'
  # Test suite for POST /todos

RSpec.describe 'Add an item for a discounted user', type: :request do
  let!(:customers) { create_list(:customer,1) }
  let!(:charge_fees) { create(:charge_fee) }
  describe 'POST api/customer/add/1' do
  #setup factories 
  let!(:discounts) { create_list(:discount,1,:nolim)}
    # valid payload

    let(:valid_attributes1) { 
      {items:[{name:'Fridge',length:3,height:16,width:4,weight:300,value:1000},{name:'Sofa',length:6,height:4,width:3,weight:100,value:500}]}
  }
    context 'when the request is valid with just discount on customer' do

      before { post '/api/customer/add/1', params: valid_attributes1 }

      it 'add items to 10% discount customer' do
        expect(json['quote_amount']).to eq(36.00)
      end

    end
  end

  describe 'Volume Charge: POST api/customer/add/2' do
  #setup factories 
  let!(:customers) { create_list(:customer,1) }
  let!(:charge_fees) { create(:charge_fee) }
  let!(:charge_volumes) { create_list(:charge_volume,1,:c2)}
    # valid payload
    let(:valid_attributes1) { 
      {items:[{name:'Fridge',length:3,height:16,width:4,weight:300,value:1000},{name:'Sofa',length:6,height:4,width:3,weight:100,value:500}]}
  }
    context 'when the request is valid with just volume charge ' do

      before { post '/api/customer/add/2', params: valid_attributes1 }
      it 'Adds items to customer with $2 volume charge' do
        expect(json['quote_amount']).to eq(568.00)
      end

    end
  end


  describe 'Value Charge: POST api/customer/add/3' do
  #setup factories 
  let!(:customers) { create_list(:customer,1) }
  let!(:charge_fees) { create(:charge_fee) }
  let!(:charge_values) { create_list(:charge_value,1,:c3) }

    # valid payload
    let(:valid_attributes1) { 
      {items:[{name:'Fridge',length:3,height:16,width:4,weight:300,value:1000},{name:'Sofa',length:6,height:4,width:3,weight:100,value:500}]}
  }
    context 'when the request is valid with just value charge ' do

      before { post '/api/customer/add/3', params: valid_attributes1 }
      it 'Adds items to customer with 5% value charge' do
        expect(json['quote_amount']).to eq(115.00)
      end

    end
  end

  describe 'Multiple Discounts: POST api/customer/add/3' do
  #setup factories 
  let!(:customers) { create_list(:customer,1) }
  let!(:charge_fees) { create(:charge_fee) }
  let!(:discounts1) { create_list(:discount,1,:lim1_multi)}
  let!(:discounts2) { create_list(:discount,1,:lim2_multi)}

    # valid payload
    let(:valid_attributes1) { 
      {items:[{name:'Fridge',length:3,height:16,width:4,weight:300,value:1000},{name:'Sofa',length:6,height:4,width:3,weight:100,value:500}]}
  }
    context 'when the request is valid with 2 limited quantity discounts ' do

      before { post '/api/customer/add/4', params: valid_attributes1 }
      it 'Adds items to customer with 5% discount and then a 10% discount' do
        expect(json['quote_amount']).to eq(37.00)
      end

    end
  end


  

end