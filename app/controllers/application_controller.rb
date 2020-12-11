class ApplicationController < ActionController::API
    include Response
    include ChargeUtility
    include ExceptionHandler
    include DiscountUtility
end
