module DiscountUtility

    def create_discounts(cust_id)
        #add check for 0 
        if params.has_key?(:discount)
            discount_list = params['discount']
            discount_list.each do |discount|
                if discount['quantity'] == "-1"
                    Discount.create!({:customer_id=> cust_id,:value=>discount['value'] ,:quantity=>discount['quantity'],:no_limit=> true})
                else #infinite discount
                    Discount.create!({:customer_id => cust_id,:value=>discount['value'] ,:quantity=>discount['quantity'],:no_limit=> false})
                end #discount quantity if 
            end #for each loop end
        end #end of if has key
    end #discount processing end


    def end_discount(current_discount)
        current_discount.active = false
        current_discount.save
    end

    def check_discount(current,stack)
        if !current.nil?
            if current.quantity == current.quantity_used #get new 
                end_discount(current)   #update this discount in model value to non-active
                stack.pop #returns next discount from stack
            else
                current
            end
        end #nil check
    end

    def update_discount_final(current)
        if !current.nil?
            if current.quantity == current.quantity_used
                end_discount(current)
            end
            current.save
        end
    end

    def create_discount_stack(cust_id)
        discount_stack = []
        limited_discounts= Discount.where(customer_id:cust_id,active: true, no_limit: false )
        unlimited_discount = Discount.where(customer_id:cust_id,active: true, no_limit: true).last
        if !limited_discounts.nil?
            limited_discounts.each do |discount|
                discount_stack.unshift discount #add discount to stack
            end
        end #end of inner limited nil check

        if !unlimited_discount.nil?
            discount_stack.unshift unlimited_discount
        end
        discount_stack
    end

end