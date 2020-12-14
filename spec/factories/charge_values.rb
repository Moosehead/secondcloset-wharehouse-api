FactoryBot.define do
    factory :charge_value do
        # customer_id {'1'}
        trait :c1 do
        customer_id {'1'}
        end

        trait :c2 do
        customer_id {'2'}
        end

        trait :c3 do
        customer_id {'3'}
        end
        value {0.05}
    end
end