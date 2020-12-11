class CustomerController < ApplicationController
    #POST /customer/create
    #create new customer
    def create
        cust_params = validate_customer_params
        #create customer first and return user_id
        @new_cust = create_customer(cust_params['name'])
        #create discounts with user_id
        create_discounts(@new_cust['id'])

        #create charge_value with user id
        create_charge_value(@new_cust['id'])

        #create charge_volume with user id
        create_charge_volume(@new_cust['id'])
        json_response(@new_cust,:created)
    end

    #add items to customer id
    def add
        #keep running track of quote
        #get most recent charge fee 
        base_fee_rate = get_latest_fee #in dollars

        #get most recent charge_volume rate to apply 
        volume_rate = get_latest_volume_rate

        #get most recent charge_item_value 
        value_percentage_rate = get_latest_value_percentage_rate

        #creates discount stack
        discount_stack = create_discount_stack(params['cust_id'])

        items = params['items']

        quote_amount = 0

        current_discount = discount_stack.pop

        items.each do |item|
            quote_amount += get_volume_price(volume_rate,item)
            quote_amount += get_value_price(value_percentage_rate,item)
            #first check if current discount is valid
            current_discount = check_discount(current_discount,discount_stack) #replaces with either current discount or nil
            quote_amount += get_fee_price(current_discount,base_fee_rate)
        end #foreach loop

        update_discount_final(current_discount)
        #goes through items list

        json_response(quote_response(quote_amount),:ok)
    end

    #change flat fee
    def fee
        @new_fee = ChargeFee.create!(fee_params)
        json_response(@new_fee, :created)
    end

    #list all customers
    def list
        #get all users
        @users = Customer.all
        # @users.each do |user|
        #     discount_list = create_discount_stack(user.id)
        #     user = render json: user
        #     user['discounts'] = create_discount_stack(user['id'])
        # end
        json_response(@users)
    end

    private

    def fee_params
        # whitelist params
        params.permit(:value)
    end

    def validate_customer_params
        # whitelist params
        params.permit(:name,:discount,:charge_value,:charge_volume)
        # params.permit(_json: [:value, :quantity])
    end

    #create customer helpers

    def create_customer(name)
        @cust_id = Customer.create!({:name=>name})
    end

end #final end
