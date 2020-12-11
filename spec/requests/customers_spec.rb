# spec/requests/todos_spec.rb
require 'rails_helper'
  # Test suite for POST /todos

RSpec.describe 'Customer API', type: :request do
let!(:customers) { create_list(:customer,10) }
let!(:charge_fees) { create(:charge_fee) }
# let!(:charge_volumes) { create_list(:charge_volume,10)}
# let!(:charge_values) { create_list(:charge_value,10)}
# let!(:discounts) { create_list(:discount,2,:lim)}
# let!(:discounts2) { create_list(:discount,3,:nolim)}
# let!(:discounts3) { create_list(:discount,2,:lim)}



# let!(:customers) { create_list(:customer,10) }
#   describe 'get /customer/list' do

#     context 'when the request is valid' do
#         before { get '/customer/list' }

#         it 'returns list of customers' do
#             # Note `json` is a custom helper to parse JSON responses
#             expect(json).not_to be_empty
#             expect(json.size).to eq(10)
#             byebug
#         end

#     end

#   end

# let (:charge_fees1)  {build(:charge_fee)}

# describe 'POST /customer/add/1' do
#     # valid payload
#     let(:valid_attributes) { 
#         {items:[{name:'Fridge',length:3,height:16,width:4,weight:300,value:1000},{name:'Sofa',length:6,height:4,width:3,weight:100,value:500}]}
#     }

#     context 'when the request is valid' do
#       before { post '/customer/add/1', params: valid_attributes }


#       byebug

#       it 'creates a new fee' do
#         expect(json['value']).to eq(20)
#       end

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end

#   end


  describe 'POST /customer/fee' do
    # valid payload
    let(:valid_attributes) { { value:20} }

    context 'when the request is valid' do
      before { post '/customer/fee', params: valid_attributes }
      it 'creates a new fee' do
        expect(json['value']).to eq(20)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  end
  
#   describe 'POST /customer/create' do
#     # valid payload
#     let(:valid_attributes) { 
#         { name: 'A', discount: [{value:0.10,quantity:100},{value:0.15,quantity:150},{value:0.20,quantity:-1}], charge_value:0.05, charge_volume:2} 
#     }

#     context 'when the request is valid' do
#       before { post '/customer/create', params: valid_attributes }

#       it 'creates a new customer' do
#         expect(json['name']).to eq('A')
#       end

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end

    # context 'when the request is invalid' do
    #   before { post '/todos', params: { title: 'Foobar' } }

    #   it 'returns status code 422' do
    #     expect(response).to have_http_status(422)
    #   end

    #   it 'returns a validation failure message' do
    #     expect(response.body)
    #       .to match(/Validation failed: Created by can't be blank/)
    #   end
    # end
#   end

end