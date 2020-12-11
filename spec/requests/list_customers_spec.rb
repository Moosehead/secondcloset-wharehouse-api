# spec/requests/todos_spec.rb
require 'rails_helper'
  # Test suite for POST /todos

RSpec.describe 'GET list of all customers ', type: :request do
let!(:customers) { create_list(:customer,10) }
  describe 'get /customer/list' do
    context 'when the request is valid' do
        before { get '/customer/list' }
        it 'returns list of customers' do
            # Note `json` is a custom helper to parse JSON responses
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

    end

  end
end