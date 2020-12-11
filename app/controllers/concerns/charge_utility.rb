module ChargeUtility

    def create_charge_value(cust_id)
        if params.has_key?(:charge_value)
            if params['charge_value'].to_f < 1
                ChargeValue.create!(charge_obj(cust_id,params['charge_value']))
            else
                #throw error too large
            end
        end #end of has key if 
    end

    def create_charge_volume(cust_id)
        if params.has_key?(:charge_volume)
            ChargeVolume.create!(charge_obj(cust_id,params['charge_volume']))
        end #end of has key if 
    end

    def get_volume_price(volume_rate,item)
        if !volume_rate.nil?
            volume_price = calculate_volume(item) * volume_rate
        else
            0
        end
    end

    def calculate_volume(item)
        volume = item['height'].to_f * item['length'].to_f* item['width'].to_f
    end

    def charge_obj(cust_id,value)
        {customer_id:cust_id,value:value}
    end

    def get_fee_price(current_discount,fee)
        if !current_discount.nil?
            current_discount.quantity_used +=1
            discount_fee = fee * (1-current_discount.value)
        else
            fee
        end
    end

    def get_value_price(value_percent_rate,item)
        if !value_percent_rate.nil?
            value_price = value_percent_rate * item['value'].to_f
        else
            0
        end
    end

    def get_latest_value_percentage_rate
        if ChargeValue.exists?(customer_id:params['cust_id'])
            ChargeValue.where(customer_id:params['cust_id']).last['value']
        end
    end

    def get_latest_volume_rate
        if ChargeVolume.exists?(customer_id:params['cust_id'])
            ChargeVolume.where(customer_id:params['cust_id']).last['value']
        end
    end

    def get_latest_fee
        ChargeFee.last['value']
    end

    def create_charge_value(cust_id)
        if params.has_key?(:charge_value)
            if params['charge_value'].to_f < 1
                ChargeValue.create!(charge_obj(cust_id,params['charge_value']))
            else
                #throw error too large
            end
        end #end of has key if 
    end

    def create_charge_volume(cust_id)
        if params.has_key?(:charge_volume)
            ChargeVolume.create!(charge_obj(cust_id,params['charge_volume']))
        end #end of has key if 
    end

end