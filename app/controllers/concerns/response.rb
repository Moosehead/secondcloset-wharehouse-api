module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def quote_response(quote_value)
      {"quote_amount": quote_value}
    end
    
  end